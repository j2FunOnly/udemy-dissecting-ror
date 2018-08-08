class Portfolio < ApplicationRecord
  include Placeholder

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  has_many :technologies, inverse_of: :portfolio, dependent: :destroy
  accepts_nested_attributes_for :technologies,
    reject_if: -> (attrs) { attrs['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :subtitle_items, -> (v) { where(subtitle: v) }

  scope :by_position, -> { order(:position) }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end
end
