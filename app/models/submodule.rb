class Submodule < ActiveRecord::Base
  has_many:comments
  has_many :bugs
  belongs_to :projects
  validates :name,presence:true
  validates :desc,presence:true
  validates :deadline,presence:true
  validates :score,presence:true
end
