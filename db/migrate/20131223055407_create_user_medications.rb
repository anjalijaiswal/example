class CreateUserMedications < ActiveRecord::Migration
  def up
    create_table :user_medications do |t|
      t.string :dosage
      t.belongs_to :drug
      t.belongs_to :user

      #t.timestamps
    end
  end
  def down
   	drop_table :user_medications
  end
end
