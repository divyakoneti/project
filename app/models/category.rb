class Category < ActiveRecord::Base
	has_many :books
	
	validates :name ,presence: true, length: {minimum: 4},uniqueness: true
end
