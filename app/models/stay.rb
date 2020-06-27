class Stay < ApplicationRecord
  belongs_to :tenant
  belongs_to :studio
  validate :stay_period_not_overlapped, :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end


  def stay_period_not_overlapped
    unless Stay.where(
      '(start_date <= ? AND end_date >= ?) OR (start_date >= ? AND start_date <= ?)',
      start_date, start_date,
      start_date, end_date
    ).empty?
      errors.add(:start_date, 'Invalid period.')
    end
  end

end
