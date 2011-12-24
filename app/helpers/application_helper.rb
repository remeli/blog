# encoding:UTF-8
module ApplicationHelper
  

  def title
    base_title = "WebDev blog"
    if @title
      "#{base_title} / #{@title}"
    else
      base_title
    end
  end
  
  def errors_for_object(object)
    render(:partial => "shared/errors", :locals => { :object => object}) if object.errors.any?
  end
  
  def admin?(user)
    true if User.verify_access(user)
  end
  
  def user_has?
    true if User.find_by_id(session[:user_id])
  end

  def edit_img
    image_tag "edit.png"
  end
  
  def delete_img
    image_tag "delete.gif"
  end
  
  def trunc(object, length = 100)
    raw(truncate(object, :length => length ))
  end
  
  def to_date(object)
    object.created_at.to_date
  end
  
  def owner?(object)
    unless current_user
      false
    else
      if current_user.id == object.user.id
        true
      end
    end
  end
  
  def username(object)
    object.nickname ? object.nickname : object.email
  end
  
end
