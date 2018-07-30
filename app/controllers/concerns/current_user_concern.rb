module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    @guest ||= GuestUser.new.tap do |g|
      g.name = "Guest User"
      g.email = "guest@example.com"
    end
  end
end
