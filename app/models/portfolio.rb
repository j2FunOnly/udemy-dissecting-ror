class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies, inverse_of: :portfolio
  accepts_nested_attributes_for :technologies,
    reject_if: -> (attrs) { attrs['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :subtitle_items, -> (v) { where(subtitle: v) }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end
end
