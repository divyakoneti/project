class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :catagory
	has_many :reviews
	validates :title, presence: true
	validates :author, presence: true
	validates :description ,presence: true
   mount_uploader :image ,ImageUploader
 end  

