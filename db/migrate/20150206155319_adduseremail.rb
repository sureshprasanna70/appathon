class Adduseremail < ActiveRecord::Migration
  def change
    add_column :comments,:comment_owner,:text
  end
end
