class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :userID
      t.string :title
      t.string :description
      t.boolean :isBan
      t.integer :imageID

      t.timestamps
    end
  end
end
