class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :venue
      t.string :description
      t.integer :member_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
