class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :fullname
      t.boolean :active

      t.timestamps
    end
  end
end
