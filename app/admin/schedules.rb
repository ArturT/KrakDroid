ActiveAdmin.register Schedule do
  scope :start_time_asc, default: true

  index do
    column :speaker
    column :room_id do |schedule|
      schedule.room.name unless schedule.room.blank?
    end
    column :topic_pl
    column :topic_en
    column :description_pl do |schedule|
      msg_if_blank(schedule.description_pl)
    end
    column :description_en do |schedule|
      msg_if_blank(schedule.description_en)
    end
    column :start_time
    column :end_time
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :speaker
      f.input :room
      f.input :topic_pl
      f.input :topic_en
      f.input :description_pl
      f.input :description_en
      f.input :start_time, as: :just_datetime_picker
      f.input :end_time, as: :just_datetime_picker
    end

    f.buttons
  end
end
