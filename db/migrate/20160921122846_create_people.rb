class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :age
      t.string :income
      t.string :marital_status

      t.timestamps
    end
  end
end
