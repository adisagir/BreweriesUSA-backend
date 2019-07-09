class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.integer :stars
      t.string :content
      t.string :image

      t.timestamps
    end
  end
end
