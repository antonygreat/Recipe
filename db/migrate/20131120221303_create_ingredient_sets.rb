class CreateIngredientSets < ActiveRecord::Migration
  def change
    create_table :ingredient_sets do |t|
      t.integer :recipeID
      t.integer :ingredientID
      t.decimal :amountNum
      t.string :unitOfMeasure

      t.timestamps
    end
  end
end
