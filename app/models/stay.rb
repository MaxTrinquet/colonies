class Stay < ApplicationRecord
  belongs_to :tenant
  belongs_to :studio

  validates :duration, numericality: { greater_than: 0}
end
