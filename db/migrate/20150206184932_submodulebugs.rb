class Submodulebugs < ActiveRecord::Migration
  def change
    add_column :bugs,:submodule_id,:integer
  end
end
