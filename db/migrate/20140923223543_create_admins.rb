class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name, limit: 100, null: false
      t.string :email, limit: 50

      ## Devise: Database authenticatable
      t.string :username, limit: 30, null: false
      t.string :encrypted_password, null: false

      t.timestamps
    end

    add_index :admins, :username, unique: true
  end
end
