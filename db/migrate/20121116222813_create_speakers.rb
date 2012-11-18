class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.text :description_pl
      t.text :description_en
      t.boolean :organizer, :default => false

      t.timestamps
    end
  end
end
