class StaysController < ApplicationController

  def show
    @stay = Stay.find(params[:id])

    @stay_range = (@stay.start_date..@stay.end_date).group_by(&:month).map do |group|
      group.last.first..group.last.last
    end

  end

  def index
    @stays = Stay.all
  end



end
