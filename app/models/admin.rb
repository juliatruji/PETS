# == Schema Information
#
# Table name: admins
#
#  id         :bigint           not null, primary key
#  name       :string
#  user       :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
