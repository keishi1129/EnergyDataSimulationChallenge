class CreateEnergies < ActiveRecord::Migration[5.2]
  def change
    create_table :energies do |t|
      t.integer :label, null: false
      t.integer :house_id, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.decimal :temperature, precision: 3, scale: 1, null: false
      t.decimal :daylight, precision: 4, scale: 1, null: false
      t.integer :energy_production, null: false

      t.timestamps
    end

    add_index :energies, [:house_id, :year, :month], unique: true
  end
end
