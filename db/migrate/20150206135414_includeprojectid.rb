class Includeprojectid < ActiveRecord::Migration
  def change
    add_column :submodules,:project_id,:integer
  end
end
