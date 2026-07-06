class Trainer < ApplicationRecord
  belongs_to :store
  belongs_to :user, optional: true
  has_many :customers
end
