class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :place
      t.string :url
      t.datetime :happen_at
      t.string :lat
      t.string :long
      t.string :address
      t.references :protocol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
