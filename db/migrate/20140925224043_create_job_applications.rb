class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.references :job, index: true, null: false
      t.references :user, index: true, null: false
      t.text :cover_letter
      t.references :status, index: true, null: false

      t.timestamps
    end
  end
end
