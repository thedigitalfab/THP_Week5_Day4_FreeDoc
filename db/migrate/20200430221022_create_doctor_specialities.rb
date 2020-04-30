class CreateDoctorSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_specialities do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :speciality, index: true
      
      t.timestamps
    end
  end
end
