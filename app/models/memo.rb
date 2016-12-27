# Model for the memos
class Memo < ActiveRecord::Base
	# Validates the presence of memo
	validates :description, presence: true
end