class Stay < ApplicationRecord
  belongs_to :tenant
  belongs_to :studio
  has_many :discounts
  validate :stay_period_not_overlapped, :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  # custom validation
  def stay_period_not_overlapped
    # binding.pry if $debug
    unless Stay.where('(
      (start_date <= ? AND end_date >= ?)
      OR
      (start_date <= ? AND end_date >= ?)
      OR
      (start_date >= ? AND end_date <= ?)
      )',
        start_date, start_date,
        end_date, end_date,
        start_date, end_date,)
        .where(studio_id: studio_id).empty?
        errors.add(:start_date, "not available")
    end
  end

end
