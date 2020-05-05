class AddIconToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :icon, :string
  end
end
