# == Schema Information
#
# Table name: veterinary_appointments
#
#  id           :bigint           not null, primary key
#  image        :string
#  control_type :string
#  date         :date
#  pet_id       :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class VeterinaryAppointment < ApplicationRecord
  belongs_to :pet
  mount_uploader :image, VaccineUploader
end
