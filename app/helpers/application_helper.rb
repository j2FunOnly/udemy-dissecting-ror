module ApplicationHelper
  def login_helper
    if current_user.is_a? GuestUser
      (link_to "Login", new_user_session_path) +
      '<br>'.html_safe +
      (link_to "Register", new_user_registration_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
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
end
