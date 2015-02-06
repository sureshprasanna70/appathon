class Bug < ActiveRecord::Base
  belongs_to :submodules
  validates :name,presence:true
  validates :desc,presence:true
  validates :assigned_to,presence:true
  validates :status,presence:true
end
