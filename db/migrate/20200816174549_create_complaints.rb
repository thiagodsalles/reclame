class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :country
      t.string :state
      t.string :city
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
