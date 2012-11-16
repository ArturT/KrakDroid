class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :topic_pl
      t.string :topic_en
      t.text :description_pl
      t.text :description_en
      t.datetime :start_time
      t.datetime :end_time
      t.integer :speaker_id

      t.timestamps
    end
  end
end
