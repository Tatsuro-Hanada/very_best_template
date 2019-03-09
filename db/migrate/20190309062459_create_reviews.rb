class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :member_id
      t.integer :event_id
      t.integer :rating

      t.timestamps
    end
  end
end
