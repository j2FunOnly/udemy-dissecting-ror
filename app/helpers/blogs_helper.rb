module BlogsHelper
  def gravatar_helper(user)
    image_tag user.gravatar_url, width: 20
  end
end
