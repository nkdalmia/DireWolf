class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false
      t.string :phone, limit: 20
      t.text :resume

      t.timestamps
    end

  end
end
