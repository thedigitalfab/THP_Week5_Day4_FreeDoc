# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Clean Database:
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all
DoctorSpeciality.destroy_all

# Create a list of Specialities:
specialities = [
    Speciality.create(name: "Neurology"),
    Speciality.create(name: "Ophthalmology"),
    Speciality.create(name: "Obstetrics & Gynecology"),
    Speciality.create(name: "Endocrinology"),
    Speciality.create(name: "Pediatrics"),
    Speciality.create(name: "Psychiatry"),
    Speciality.create(name: "Preventive Medicine"),
    Speciality.create(name: "Oncology"),
    Speciality.create(name: "Sergery"),
    Speciality.create(name: "Urology"),
    Speciality.create(name: "Medical Genetics"),
    Speciality.create(name: "Nephrology"),
    Speciality.create(name: "Geriatric medicine"),
    Speciality.create(name: "Hematology"),
    Speciality.create(name: "Gastroenterology"),
    Speciality.create(name: "Dermatology")
]

# Create a list of Cities:
cities = [
    City.create(name: "Paris", zip_code: "75000"),
    City.create(name: "Marseille", zip_code: "13000"),
    City.create(name: "Lyon", zip_code: "69000"),
    City.create(name: "Toulouse", zip_code: "31000"),
    City.create(name: "Nice", zip_code: "06000"),
    City.create(name: "Nantes", zip_code: "44000"),
    City.create(name: "Strasbourg", zip_code: "67000"),
    City.create(name: "Montpellier", zip_code: "34000"),
    City.create(name: "Bordeaux", zip_code: "33000"),
    City.create(name: "Lille", zip_code: "59000"),
    City.create(name: "Rennes", zip_code: "35000"),
    City.create(name: "Reims", zip_code: "51100"),
    City.create(name: "Le Havre", zip_code: "76600"),
    City.create(name: "Saint-Etienne", zip_code: "42100"),
    City.create(name: "Toulon", zip_code: "83100"),
    City.create(name: "Grenoble", zip_code: "38000"),
    City.create(name: "Dijon", zip_code: "21000"),
    City.create(name: "Nîmes", zip_code: "30000"),
    City.create(name: "Angers", zip_code: "49000"),
    City.create(name: "Le Mans", zip_code: "72000"),
    City.create(name: "Brest", zip_code: "29000"),
    City.create(name: "Tours", zip_code: "37000"),
    City.create(name: "Limoges", zip_code: "87000"),
    City.create(name: "Perpignan", zip_code: "66000"),
    City.create(name: "Metz", zip_code: "57000")
]

# Create Doctors, with his city and specialities
doctors = []
25.times do
    doctor = Doctor.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city_id: cities[rand(0..24)]
    )
    DoctorSpeciality.create(doctor_id: doctor ,speciality_id: specialities[rand(0..7)])
    DoctorSpeciality.create(doctor_id: doctor ,speciality_id: specialities[rand(8..15)])
    doctors << doctor
end

# Create Patients, with his city:
patients = []
300.times do
    patient = Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city_id: cities[rand(0..24)]
    )
    doctors << doctor
end

# Randomly create appointments:
500.times do
    Appointment.create(
        date: Faker::Date.forward(days: 90),
        doctor_id: doctors[rand(0..24)],
        patient_id: patients[rand(0..199)],
        city_id: cities[rand(0..24)]
    )
end