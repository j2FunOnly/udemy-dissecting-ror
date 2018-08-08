class Portfolio < ApplicationRecord
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  has_many :technologies, inverse_of: :portfolio, dependent: :destroy
  accepts_nested_attributes_for :technologies,
    reject_if: -> (attrs) { attrs['name'].blank? }

  validates_presence_of :title, :body

  scope :subtitle_items, -> (v) { where(subtitle: v) }

  scope :by_position, -> { order(:position) }
end
