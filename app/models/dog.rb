class Dog < ApplicationRecord
    validates :name, presence: true

    has_many :toys
end