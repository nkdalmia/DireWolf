class CreateJobApplicationStatuses < ActiveRecord::Migration
  def change
    create_table :job_application_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end
