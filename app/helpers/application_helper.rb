module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a? GuestUser
      (link_to "Login", new_user_session_path, class: style) +
      ' ' +
      (link_to "Register", new_user_registration_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    return unless session[:source]

    greeting = "Thank you for visiting me from #{escape_once session[:source]}"
    content_tag :p, greeting, class: 'source-greeting'
  end

  def generate_copyright
    SimpleViewToolService::Renderer.copyright 'j2FunOnly', 'Sample message'
  end

  def nav_items
    [
      {url: root_path, title: 'Home'},
      {url: about_me_path, title: 'About me'},
      {url: contact_path, title: 'Contact me'},
      {url: blogs_path, title: 'My Blog'},
      {url: portfolios_path, title: 'Portfolio'}
    ]
  end

  def nav_helper(style = '', tag_type = false)
    nav_items.map do |item|
      nav = "<a href='#{item[:url]}' class='#{style} #{nav_active? item[:url]}'>#{item[:title]}</a>".html_safe
      tag_type ? content_tag(tag_type, nav) : nav
    end.join('').html_safe
  end

  def nav_active?(path)
    'active' if current_page? path
  end
end
