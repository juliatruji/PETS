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
require "test_helper"

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
