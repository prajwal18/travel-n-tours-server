class Place < ApplicationRecord
  has_many :events, dependent: :destroy
end
