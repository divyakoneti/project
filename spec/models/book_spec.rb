require 'rails_helper'

RSpec.describe Book, type: :model do
	context 'is invalid title' do
		it "the title is invalid" do
		book=Book.create(title: '',author: '',description:'')
		should_not be_valid	
	    end
	end
	end	