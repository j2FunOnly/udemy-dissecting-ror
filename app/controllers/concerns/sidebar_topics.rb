module SidebarTopics
  extend ActiveSupport::Concern

  def set_sidebar_topics
    @sidebar_topics = Topic.with_published_blogs
  end
end
