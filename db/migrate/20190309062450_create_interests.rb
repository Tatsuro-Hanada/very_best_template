class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.integer :member_id
      t.integer :event_id

      t.timestamps
    end
  end
end
