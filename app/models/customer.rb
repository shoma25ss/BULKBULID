class Customer < ApplicationRecord
  belongs_to :store
  belongs_to :trainer
end
