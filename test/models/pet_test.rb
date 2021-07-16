# == Schema Information
#
# Table name: pets
#
#  id              :bigint           not null, primary key
#  name            :string
#  race            :string
#  gender          :string
#  color           :string
#  sterilized      :boolean
#  size            :string
#  image           :string
#  adoption_status :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
