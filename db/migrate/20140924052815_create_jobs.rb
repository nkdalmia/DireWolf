class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, limit: 200, :null => false
      t.string :description
      t.references :employer, index: true, :null => false
      t.references :category, index: true, :null => false
      t.datetime :deadline
      t.boolean :public

      t.timestamps
    end
  end
end
