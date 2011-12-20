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

  # admin:
  def edit_img
    image_tag "edit.png"
  end
  
  def delete_img
    image_tag "delete.gif"
  end
end
