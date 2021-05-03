class Label < ApplicationRecord
  belongs_to :area
  belongs_to :canvas
  belongs_to :created_user, class_name: 'User', foreign_key: :created_user_id
  belongs_to :updated_user, class_name: 'User', foreign_key: :updated_user_id, optional: true

  validates :title, presence: true
  validates :position, presence: true

  before_validation :build_position

  def build_position
    max_position = canvas.labels.where(area: area).maximum(:position)
    self.position = max_position.present? ? max_position + 1 : 1
  end
end