class Position < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 2, maximum: 25}
	validates :allocated_money, presence: true, numericality: {greater_than_or_equal_to: 0}
end