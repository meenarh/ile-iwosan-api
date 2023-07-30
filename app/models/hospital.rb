class Hospital < ApplicationRecord
    belongs_to :hospital_admin
    
    validates :name, presence: true, uniqueness: true
    validates :website, presence: true, uniqueness: true
end
