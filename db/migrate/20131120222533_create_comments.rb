class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :recipeID
      t.integer :userID
      t.boolean :isBan
      t.string :comment

      t.timestamps
    end
  end
end
