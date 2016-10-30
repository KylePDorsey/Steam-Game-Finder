class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
    	t.string :title
    	t.integer :time_played
    	t.integer :rating
    	t.integer :user_id

      t.timestamps(null: false)
    end
  end
end
