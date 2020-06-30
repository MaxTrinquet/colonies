class StaysController < ApplicationController
  before_action :set_studio, :set_tenant, only:[:show]

  def show
      @stay = Stay.find(params[:id])

      @stay_range = (@stay.start_date..@stay.end_date).group_by(&:month).map do |group|
        group.last.first..group.last.last
      end

      if @stay.discounts.present?
        set_discount_range_date
      end
      month_of_today_date
      daily_studio_price

  end

  def index
    @stays = Stay.all
  end

  private

  # Some value used in show.html.erb
  def set_studio
    @studio = Stay.find(params[:id]).studio
  end

  def set_tenant
    @tenant = Stay.find(params[:id]).tenant
  end

  # used for discount date range
  def set_discount_range_date
      discount_end_date = @stay.discounts[0].start_discount_date + @stay.discounts[0].duration
      @discount_range_date = (@stay.discounts[0].start_discount_date..discount_end_date).group_by(&:month).map do |group|
      group.last.first..group.last.last
      end
  end

  def month_of_today_date
    @first_day_of_the_month = Date.today.beginning_of_month
  end

  def daily_studio_price
    @daily_studio_price = @studio.price / 31
  end



end
