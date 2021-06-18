class Label::Update < ApplicationService
  object :label, class: Label
  object :user, class: User
  string :title, :description
  integer :area_id

  validates :title,
  presence: true

  def execute
    label.updated_user_id = user
    unless label.update(area_id: area_id, title: title, description: description)
      errors.merge!(label.errors)
    end
    label
  end
end