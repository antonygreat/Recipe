class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :userid
      t.integer :recipeid
      t.string :name

      t.timestamps
    end
  end
end
