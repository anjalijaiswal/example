class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone
      t.string :password
      t.integer :age
      t.string :type

      t.timestamps
    end
  end
end
