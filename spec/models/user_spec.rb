require 'rails_helper'

RSpec.describe User, type: :model do
	it 'email not unique' do
		user=User.new(email: '')
		user.save
		user=User.create(email: '123abc@gmail.com')
		user.errors.full_messages[0].should_not match 'already exist'
	end
	it 'when #email format is invalid' do
		user=User.new(email: '123gmail.com')   #  fail case
		should be_valid
	end	
	it 'when #email format is invalid' do
		user=User.new(email: '123@gmail.com')  #success case
		should_not be_valid
	end	
	it 'password not valid and it not contain at least 8 charcters' do #fail case
		user=User.new(password: 'abc123')
		should_not be_valid
	end	
	it 'password not valid and it not contain at least 8 charcters' do  #success case
		user=User.new(password: 'abc12345')
		should_not be_valid
	end	
	it 'is valid' do
		should be_valid
	end	
end	    	