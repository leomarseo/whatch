class CreateAvailableServices < ActiveRecord::Migration[6.0]
  def change
    create_table :available_services do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
