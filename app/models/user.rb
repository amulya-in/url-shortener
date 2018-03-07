class User < ApplicationRecord
	validates :email, presence: true,
						format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }          
	has_secure_password
	has_many :urls, dependent: :destroy
	before_create :generate_api_key
	
	private
		def generate_api_key
			begin
			  self.api_key = SecureRandom.base64.tr('+/=', 'Dvq')
			end while self.class.exists?(api_key: api_key)
		end
end
