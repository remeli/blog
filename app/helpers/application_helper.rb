# encoding:UTF-8
module ApplicationHelper
  
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
  
  def trunc(object)
    truncate(object, :length => 100)
  end
  
  def to_date(object)
    object.created_at.to_date
  end
end
