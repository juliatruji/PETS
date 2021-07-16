# == Schema Information
#
# Table name: adopters
#
#  id         :bigint           not null, primary key
#  name       :string
#  dni        :string
#  address    :string
#  cel        :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Adopter < ApplicationRecord
  has_many :adoption, dependent: :destroy

end
