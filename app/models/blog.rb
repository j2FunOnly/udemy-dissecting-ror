class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :i18n]

  enum status: {draft: 0, published: 1}
end
