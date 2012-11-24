# you must restart rails server after change this file
module ActiveAdmin::ViewsHelper
  def msg_if_blank(field)
    if field.blank?
      raw '<span style="color:red;">blank</span>'
    else
      raw '<span style="color:green;">ok</span>'
    end
  end
end
