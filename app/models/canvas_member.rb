class CanvasMember < ApplicationRecord
  belongs_to :canvas
  belongs_to :user

  enumerize :authority, in: %i(admin member), default: :admin
end