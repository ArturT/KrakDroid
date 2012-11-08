module ApplicationHelper
  def banner(img, url, title)
    link_to image_tag(image_path(img)), url, title: title, class: 'banner'
  end
end
