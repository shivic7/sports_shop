class AddDisabledToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :disabled, :boolean, default: false
  end
end
