class HospitalAdmin < ApplicationRecord
    has_secure_password
    has_many :hospitals

    validates :email, presence: true, uniqueness: true
    validates_with EmailAddress::ActiveRecordValidator, field: :email

    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

    
end
