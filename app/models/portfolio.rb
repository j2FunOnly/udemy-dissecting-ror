class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :subtitle_items, -> (v) { where(subtitle: v) }
end
