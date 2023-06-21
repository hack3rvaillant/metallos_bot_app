class AddPositionToProtocols < ActiveRecord::Migration[7.0]
  def change
    add_column :protocols, :position, :integer
  end
end
