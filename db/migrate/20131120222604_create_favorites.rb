class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :recipeID
      t.integer :userID

      t.timestamps
    end
  end
end
