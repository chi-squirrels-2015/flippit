class User < ActiveRecord::Base

	has_many :rounds

	validates :name, presence: true

  def password=(plaintext)
    self.password = BCrypt::Password.create(plaintext)
  end

  def authenticate(plaintext_password)
    BCrypt::Password.new(self.password) == plaintext_password
  end

end
