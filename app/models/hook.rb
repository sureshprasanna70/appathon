class Hook < ActiveRecord::Base
  validate :purpose,presence:true
  validate :token,presence:true
  validate :name,presence:true
end
