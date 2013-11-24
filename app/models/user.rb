class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :docs

	has_secure_password validations: false

	validates :first_name, 
		presence: true,
		uniqueness: true
	validates :last_name, 
		presence: true,
		uniqueness: true
	validates :username, 
		presence: true,
		uniqueness: true
	validates :password,
		presence: true, 
		on: :create,
		length: { minimum: 8}
	validates :unit,
		presence: true, 
		on: :create,
		length: { minimum: 4}

	def admin?
		role == 'admin'
	end
end