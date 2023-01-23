class User < ApplicationRecord
  has_many :messages
  encrypts :password
end
