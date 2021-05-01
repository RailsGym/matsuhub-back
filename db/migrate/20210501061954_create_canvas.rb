class CreateCanvas < ActiveRecord::Migration[6.1]
  def change
    create_table :canvas do |t|
      t.string :title, null: false
      t.references :owner, index: true, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
