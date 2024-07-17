class CreateProductParts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_parts do |t|
      t.references :product, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true

      t.timestamps
    end
  end
end
