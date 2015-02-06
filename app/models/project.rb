class Project < ActiveRecord::Base
  has_many :submodules
end
