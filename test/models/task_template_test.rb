# == Schema Information
#
# Table name: task_templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  due_date   :string(255)
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TaskTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
