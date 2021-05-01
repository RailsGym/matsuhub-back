class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :description, null: false
      t.string :area_type, null: false
      t.string :area_type_text, null: false

      t.timestamps
    end
  end
end
