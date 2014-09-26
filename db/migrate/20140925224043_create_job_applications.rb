class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.references :job, index: true
      t.references :user, index: true
      t.text :cover_letter
      t.references :status, index: true

      t.timestamps
    end
  end
end
