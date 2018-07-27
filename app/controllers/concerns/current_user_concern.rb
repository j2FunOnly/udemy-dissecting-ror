module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
      first_name: 'Guest',
      last_name: 'User',
      name: 'Guest User',
      email: 'example@example.com'
    )
  end
end
