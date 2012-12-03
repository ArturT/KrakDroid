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

  def put_if_even_parity(put, counter)
    put if counter % 2 == 0
  end

  # start_hour is first hour displaing in schedule table view
  def strap_schedule(schedule, start_hour)
    cell = 49 # cell width one hour

    st = schedule.start_time
    et = schedule.end_time

    strap_width = cell * ( (et.hour.to_f - st.hour.to_f) + (et.min.to_f - st.min.to_f)/60 )

    # move begin of strap to the right to one hour
    strap_begin = cell * ( (st.hour.to_f - start_hour.to_f) + st.min.to_f/60) - 8 # minus 8px

    raw %{
    <div class="relative">
      <div class="strap" onclick="jump_to_speaker(this, '#speaker_#{schedule.speaker_id}')" style="width:#{strap_width}px;margin-left:#{strap_begin}px;">
        <div class="dot"></div>
      </div>
    </div>
    }
  end

  def schedule_topic_jumper(schedule)
    raw %{
    <span class="cursor_pointer" onclick="jump_to_speaker(this, '#speaker_#{schedule.speaker_id}')">#{schedule.topic}</span>
    }
  end

  def schedule_times(schedule)
    %{
      #{schedule.start_time.strftime('%H:%M')} - #{schedule.end_time.strftime('%H:%M')}
    }
  end

  def call_for_papers
    raw %{
      <div>#{t 'logo.call_for_papers_html'}</div>
      <a href="https://docs.google.com/spreadsheet/viewform?formkey=dG56Z1hmU1ZRNFEyNkNhMTFMLThaX3c6MQ" class="button">#{t 'logo.call_for_papers_button'} <span class="aquo_big">&rsaquo;</span></a>
    }
  end

  def registration_button
    raw %{
      <div><br /><br /></div>
      <a href="http://krakdroid.eventbrite.com" class="button">#{t 'logo.registration_button'} <span class="aquo_big">&rsaquo;</span></a>
    }
  end
end
