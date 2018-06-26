class Portfolio < ApplicationRecord
  validates_precense_of :title, :body, :main_image, :thumb_image
end
