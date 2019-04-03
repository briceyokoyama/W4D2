class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  PERMITTED_COLORS = ['White', 'Black', 'Tabby', 'Orange', 'Grey', 'Spray-painted']
  PERMITTED_SEXES = ['M', 'F', 'O']

  validates :color, inclusion: { in: PERMITTED_COLORS, message: ": please pick a valid color."}
  validates :sex, inclusion: { in: PERMITTED_SEXES, message: ": please pick a valid sex."}
  validates :birth_date, :name, :description, presence: true

  has_many :cat_rental_requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    primary_key: :id,
    dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

end
