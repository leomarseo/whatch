class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :company, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
