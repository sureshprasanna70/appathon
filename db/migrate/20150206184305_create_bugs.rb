class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.text :name
      t.text :desc
      t.text :assigned_to

      t.timestamps
    end
  end
end
