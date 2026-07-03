class Store < ApplicationRecord
    has_many :trainers
    has_many :customers
end
