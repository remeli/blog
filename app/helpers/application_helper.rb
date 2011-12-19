# encoding:UTF-8
module ApplicationHelper
  def errors_for_object(object)
    render(:partial => "shared/errors", :locals => { :object => object}) if object.errors.any?
  end
end
