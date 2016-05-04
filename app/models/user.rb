class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates :email, presence: true
  validates :password, presence: true
end
