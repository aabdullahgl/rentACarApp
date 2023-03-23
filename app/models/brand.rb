class Brand < ApplicationRecord
  has_many :models
  has_one_attached :brand_image
end
