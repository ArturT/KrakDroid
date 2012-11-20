module ApplicationHelper
  def banner(img, url, title = nil, css_class = nil)
    raw %{
      <div class="banner_container#{' '+css_class unless css_class.nil?}">
        #{link_to(image_tag(image_path(img)), url, title: title)}
      </div>
    }
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

  def menu_arrow(title, jump_to, left_or_right)
    title_text = t "logo.menu.#{title}"
    raw %{
    <div class="menu_arrow_container menu_end_#{left_or_right}" id="menu_arrow_#{title}" onclick="go_to_by_scroll('#{jump_to}',0,22)">
      <div class="menu_bg_#{left_or_right}">
        <div class="arrow_gradient_dimensions arrow_gradient_#{left_or_right} text">
          #{title_text}
        </div>
      </div>
      <div class="menu_arrow_dimensions menu_arrow_#{left_or_right}"></div>
    </div>
    }
  end

  def text(text)
    if text.blank?
      t 'common.coming_soon'
    else
      raw text
    end
  end
end
