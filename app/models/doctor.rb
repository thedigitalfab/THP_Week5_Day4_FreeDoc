class Doctor < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    belongs_to :city, optional: true
    has_many :doctor_specialities, dependent: :destroy
    has_many :specialities, through: :doctor_specialities
end
