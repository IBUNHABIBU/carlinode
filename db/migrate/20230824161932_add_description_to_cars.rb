class AddDescriptionToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :description, :string
  end
end
