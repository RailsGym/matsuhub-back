class RemoveAreaTypeTextFromAreas < ActiveRecord::Migration[6.1]
  def change
    remove_column :areas, :area_type_text, :string
  end
end
