class User < ActiveRecord::Base
  has_secure_password

  has_many :decisions
  has_many :answers
end
