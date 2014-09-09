# == Schema Information
#
# Table name: service_templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  leader_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ServiceTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
