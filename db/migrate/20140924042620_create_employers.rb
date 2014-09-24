class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name, :null => false
      t.string :contact_name, limit: 100, :null => false
      t.string :email, limit: 50, :null => false
      t.string :encrypted_password, :null => false, :default => ""

      t.timestamps
    end
    add_index :employers, :email, unique: true
  end
end
