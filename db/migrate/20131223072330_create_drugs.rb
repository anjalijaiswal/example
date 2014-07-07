class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :drug_name_long
      t.string :drug_name_short
      t.string :generic_name

      t.timestamps
    end
  end
end
