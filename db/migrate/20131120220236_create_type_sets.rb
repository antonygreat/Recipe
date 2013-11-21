class CreateTypeSets < ActiveRecord::Migration
  def change
    create_table :type_sets do |t|
      t.integer :recipeID
      t.integer :typeID

      t.timestamps
    end
  end
end
