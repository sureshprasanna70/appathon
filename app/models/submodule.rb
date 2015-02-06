class Submodule < ActiveRecord::Base
  has_many:comments
  belongs_to :projects
  validates :name,presence:true
  validates :desc,presence:true
  validates :deadline,presence:true
  validates :score,presence:true
end
