class CreateCanvasMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :canvas_members do |t|
      t.references :canvas, index: false, null: false
      t.references :user, index: false, null: false
      t.string :authority, null: false

      t.timestamps
    end
    add_index :canvas_members, [:canvas_id, :user_id], unique: true
  end
end
