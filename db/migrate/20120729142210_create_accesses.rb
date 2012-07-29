class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.references :user
      t.string :role

      t.timestamps
    end
  end
end
