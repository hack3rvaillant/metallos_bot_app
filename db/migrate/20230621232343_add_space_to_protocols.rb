class AddSpaceToProtocols < ActiveRecord::Migration[7.0]
  def change
    add_column :protocols, :space, :string
  end
end
