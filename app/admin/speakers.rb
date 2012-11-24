ActiveAdmin.register Speaker do
  scope :all, default: true

  scope :speakers do
    Speaker.speakers
  end

  scope :organizers do
    Speaker.organizers
  end

  index do
    column :name
    column :description_pl do |schedule|
      msg_if_blank(schedule.description_pl)
    end
    column :description_en do |schedule|
      msg_if_blank(schedule.description_en)
    end
    column :organizer
    column :photo do |speaker|
      image_tag speaker.photo.thumb, size: '100x100'
    end
    default_actions
  end
end
