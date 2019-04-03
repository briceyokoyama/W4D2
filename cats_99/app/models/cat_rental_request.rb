class CatRentalRequest < ApplicationRecord
  STATUS = ["APPROVED", "DENIED", "PENDING"]

  validates :status, inclusion: {in: STATUS, message: ": not a valid status."}
  validates :cat_id, :start_date, :end_date, presence: true

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id,
    primary_key: :id

  def overlapping_requests
    before_start = (-1*(Float::INFINITY)..start_date)
    after_end = (end_date...Float::INFINITY)

    (CatRentalRequest.where(start_date: our_range).length > 0) || (CatRentalRequest.where(end_date: our_range).length > 0)

  end
end
