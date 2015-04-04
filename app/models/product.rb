class Product < ActiveRecord::Base

  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'The number must be greater then 0.01'}
  validates :title, uniqueness: {message:'The title has already been taken'}
  validates :image_url, allow_blank: true, format: {
                          with: %r{\.(gif|png|jpeg|jpg)\Z}i,
                          message: 'Invalid image url'
                      }
  validates :title, length: {minimum: 4, maximum: 10, message: 'Wrong number of characters'}

end
