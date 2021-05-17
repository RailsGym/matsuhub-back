class Area < ApplicationRecord
  validates :description, presence: true
  validates :area_type, presence: true

  enumerize :area_type, in: %i(purpose vision solution superiority indicator value explicit_problem implicit_problem substitute channel situation trend profit market)
end