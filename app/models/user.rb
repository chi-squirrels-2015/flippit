class User < ActiveRecord::Base

	has_many :rounds

	validates :name, presence: true

end
