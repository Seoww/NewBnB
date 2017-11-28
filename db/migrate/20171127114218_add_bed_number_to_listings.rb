class AddBedNumberToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :bed_number, :string
  end
end
