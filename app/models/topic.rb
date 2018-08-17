class Topic < ApplicationRecord
  has_many :blogs

  validates_presence_of :title

  # scope :with_blogs, -> { includes(:blogs).where.not(blogs: {id: nil}) }
  scope :with_blogs, -> { joins(:blogs).group(:id) }
  scope :with_published_blogs, -> { with_blogs.merge(Blog.published) }
end
