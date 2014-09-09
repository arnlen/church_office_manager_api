# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  due_date   :string(255)
#  completed  :boolean          default(FALSE)
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
