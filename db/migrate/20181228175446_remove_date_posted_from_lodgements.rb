class RemoveDatePostedFromLodgements < ActiveRecord::Migration[5.2]
  def change
    remove_column :lodgements, :date_posted, :date
  end
end
