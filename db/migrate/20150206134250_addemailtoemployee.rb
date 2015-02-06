class Addemailtoemployee < ActiveRecord::Migration
  def change
    add_column :employees,:email,:text
    add_column :employees,:position,:text
  end
end
