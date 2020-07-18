class Toy <ApplicationRecord
    validates :dog_id, :name, presence: true
    belongs_to :dog
end