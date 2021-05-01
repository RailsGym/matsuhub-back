class Label < ApplicationRecord
  belongs_to :area
  belongs_to :canvas
  belongs_to :created_user, class_name: 'User', foreign_key: :created_user_id
  belongs_to :updated_user, class_name: 'User', foreign_key: :updated_user_id, optional: true

  validates :title, presence: true
  validates :position, presence: true
end