class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :i18n]

  enum status: {draft: 0, published: 1}

  validates_presence_of :title, :body, :topic

  has_many :comments, dependent: :destroy

  belongs_to :topic

  scope :recent, -> { order created_at: :desc }
end
