class AddPincodeToFacilities < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :pincode, :integer
  end
end
