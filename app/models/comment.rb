class Comment < ActiveRecord::Base
  belongs_to :submodules
  validates :content,presence:true
end
