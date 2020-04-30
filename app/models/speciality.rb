class Speciality < ApplicationRecord
    has_many :doctor_specialities, dependent: :destroy
    has_many :doctors, through: :doctor_specialities
end
