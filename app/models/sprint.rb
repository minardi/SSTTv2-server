class Sprint < ActiveRecord::Base
	belongs_to :project
	has_many :tasks
	has_many :stories
end
