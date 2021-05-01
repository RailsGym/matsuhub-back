class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.references :area, index: true, null: false
      t.references :canvas, index: true, null: false
      t.references :created_user, index: true, foreign_key: { to_table: :users }, null: false
      t.references :updated_user, index: true, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.string :description
      t.integer :position, null: false

      t.timestamps
    end
    add_index :labels, [:area_id, :canvas_id, :position], unique: true
  end
end
