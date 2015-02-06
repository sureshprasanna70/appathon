class Project < ActiveRecord::Base
  has_many :submodules
  validates :desc,presence:true
  validates :title,presence:true
end
