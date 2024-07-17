class CreateCombinations < ActiveRecord::Migration[6.0]
  def change
    create_table :combinations do |t|
      t.references :condition_part, null: false, foreign_key: { to_table: :parts }
      t.references :affected_part, null: false, foreign_key: { to_table: :parts }
      t.boolean :allowed, null: false, default: true
      t.decimal :additional_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
