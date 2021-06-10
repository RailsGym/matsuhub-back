class Label::Update < ApplicationService
  object :label, class: Label
  string :title, :description
  integer :area_id, :current_user_id

  validates :title,
  presence: true

  def execute
    label.updated_user_id = current_user_id
    unless label.update(area_id: area_id, title: title, description: description)
      errors.merge!(label.errors)
    end
    label
  end
end