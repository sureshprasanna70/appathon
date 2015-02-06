class CreateSubmodules < ActiveRecord::Migration
  def change
    create_table :submodules do |t|
      t.text :name
      t.text :desc
      t.datetime :deadline
      t.integer :score

      t.timestamps
    end
  end
end
