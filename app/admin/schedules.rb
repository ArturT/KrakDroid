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
end
