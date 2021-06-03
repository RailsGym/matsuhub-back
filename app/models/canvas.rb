class Canvas < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :labels, dependent: :destroy
  has_many :canvas_members, dependent: :destroy
  has_many :users, through: :canvas_members

  validates :title, presence: true
end