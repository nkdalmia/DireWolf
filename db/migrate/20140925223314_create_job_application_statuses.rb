class CreateJobApplicationStatuses < ActiveRecord::Migration
  def change
    create_table :job_application_statuses do |t|
      t.string :name, null: false
    end
  end
end
