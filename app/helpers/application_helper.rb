module ApplicationHelper
  def banner(img, url, title)
    raw %{<div class="banner_container">#{link_to(image_tag(image_path(img)), url, title: title, target: '_blank')}</div>}
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
    raw %{<div class="photo" style="background-image: url(#{asset_path(photo_url)});"></div>}
  end
end
