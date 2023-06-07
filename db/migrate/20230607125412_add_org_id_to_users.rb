class AddOrgIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :org, null: false, foreign_key: true
  end
end
