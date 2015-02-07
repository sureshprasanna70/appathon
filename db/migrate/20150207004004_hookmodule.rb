class Hookmodule < ActiveRecord::Migration
  def change
    add_column :hooks,:submodule_id,:integer
  end
end
