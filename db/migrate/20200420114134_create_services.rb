class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :company
      t.string :country

      t.timestamps
    end
  end
end
