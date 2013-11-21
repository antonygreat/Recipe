class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :isAdmin
      t.boolean :isBan
      t.boolean :isActivate

      t.timestamps
    end
  end
end
