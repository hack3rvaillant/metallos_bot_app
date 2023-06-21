class RemovePropsNeededFromProtocols < ActiveRecord::Migration[7.0]
  def change
    remove_column :protocols, :props_needed, :text
  end
end
