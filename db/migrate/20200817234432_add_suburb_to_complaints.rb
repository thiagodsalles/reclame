class AddSuburbToComplaints < ActiveRecord::Migration[5.2]
  def change
    add_column :complaints, :suburb, :string
  end
end
