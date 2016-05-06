class User < ActiveRecord::Base
	has_many :books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email ,presence: true,uniqueness: true,
  format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                    message: 'The format of Email is invalid'}
  validates :password, presence: true, length: { minimum: 8 }
                         
end
