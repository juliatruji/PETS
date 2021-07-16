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
end
