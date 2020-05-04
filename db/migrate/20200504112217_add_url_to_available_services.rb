class AddUrlToAvailableServices < ActiveRecord::Migration[6.0]
  def change
    add_column :available_services, :url, :string
  end
end
