class Endofsubmodule < ActiveRecord::Migration
  def change
    add_column :submodules,:close,:boolean
  end
end
