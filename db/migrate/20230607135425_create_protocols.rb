class CreateProtocols < ActiveRecord::Migration[7.0]
  def change
    create_table :protocols do |t|
      t.string :status, default: "draft"
      t.references :artist, null: false, foreign_key: true
      t.string :punchline
      t.string :official_title
      t.integer :creation_year
      t.text :content
      t.text :about
      t.string :participation_mode
      t.text :props_needed
      t.boolean :copyright_cleared, default: false
      t.string :duration
      t.text :internal_notes
      t.references :org, null: false, foreign_key: true

      t.timestamps
    end
  end
end
