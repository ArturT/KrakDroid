module ApplicationHelper
  def banner(img, url, title = nil)
    raw %{<div class="banner_container">#{link_to(image_tag(image_path(img)), url, title: title)}</div>}
  end

  def choose_language
    lang = params[:locale]

    pl = link_to 'PL', '/'
    en = link_to 'EN', '/en'

    if lang == 'en'
      raw "#{pl} <span>EN</span>"
    else
      raw "<span>PL</span> #{en}"
    end
  end

  def speaker_photo(photo_url)
    raw %{<div class="circle photo" style="background-image: url(#{asset_path(photo_url)});"><div class="circle gray_layer"></div></div>}
  end
end
