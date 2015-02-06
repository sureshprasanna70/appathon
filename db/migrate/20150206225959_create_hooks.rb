class CreateHooks < ActiveRecord::Migration
  def change
    create_table :hooks do |t|
      t.string :name
      t.string :token
      t.string :purpose

      t.timestamps
    end
  end
end
