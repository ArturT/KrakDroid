class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name_pl, :null => false
      t.string :name_en, :null => false

      t.timestamps
    end
  end
end
