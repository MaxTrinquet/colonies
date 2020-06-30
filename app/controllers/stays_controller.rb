class StaysController < ApplicationController

  def show
      @stay = Stay.find(params[:id])

      @stay_range = (@stay.start_date..@stay.end_date).group_by(&:month).map do |group|
        group.last.first..group.last.last
      end

      if @stay.discounts.present?
        end_date = @stay.discounts[0].start_discount_date + @stay.discounts[0].duration
        @discount_range_date = (@stay.discounts[0].start_discount_date..end_date).group_by(&:month).map do |group|
          group.last.first..group.last.last
        end
        @discount_range_date
      end
  end


  def index
    @stays = Stay.all
  end


end
