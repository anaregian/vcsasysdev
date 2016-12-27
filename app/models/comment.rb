# Model for the memos
class Comment < ActiveRecord::Base
	# Validates the presence of memo
	validates :description, presence: true
end