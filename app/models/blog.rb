class Blog < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: [:slugged, :i18n]
end
