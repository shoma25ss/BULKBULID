class Trainer < ApplicationRecord
  belongs_to :store
  has_many :customers
end
