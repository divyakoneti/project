require 'rails_helper'

RSpec.describe Category, type: :model do
	it "is valid name" do
		category=Category.new(name:'entertainment')
	expect(category).to be_valid
	end
end		