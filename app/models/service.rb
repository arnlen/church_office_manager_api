class Service < ActiveRecord::Base

	belongs_to :office

	has_many :tasks

	has_and_belongs_to_many :members

end
