class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.float :daily_price
      t.integer :model_year
      t.string :status

      t.timestamps
    end
  end
end
