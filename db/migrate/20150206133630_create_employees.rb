class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.text :area
      t.string :proficiency
      t.boolean :available

      t.timestamps
    end
  end
end
