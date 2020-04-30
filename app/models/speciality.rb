class Speciality < ApplicationRecord
    has_many :doctor_specialities, dependent: true
    has_many :doctors, through: :doctor_specialities
end
