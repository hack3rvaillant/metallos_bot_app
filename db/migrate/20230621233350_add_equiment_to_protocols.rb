class AddEquimentToProtocols < ActiveRecord::Migration[7.0]
  def change
    add_column :protocols, :equipment, :string
  end
end
