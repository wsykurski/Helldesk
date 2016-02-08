module ApplicationHelper
  def provide_title(subtitle='')
    hell = "Helldesk"
    if subtitle.empty?
      hell
    else
      hell + " | " + subtitle
    end
  end

  def login_logout
    if @current_user
      link_to 'Logout', :logout, :method => :delete
    else
      link_to 'Login', :login
    end
  end

  def add_new_lines(text)
    (h text).gsub(/\n/, "<br />").html_safe
  end
end
