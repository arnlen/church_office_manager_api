# == Schema Information
#
# Table name: services
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  task_left           :integer          default(0)
#  task_done           :integer          default(0)
#  task_total          :integer          default(0)
#  ready               :boolean          default(FALSE)
#  leader_id           :integer
#  member_in_charge_id :integer
#  office_id           :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
