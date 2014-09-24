class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :phone, limit: 20

      t.timestamps
    end
  end
end
