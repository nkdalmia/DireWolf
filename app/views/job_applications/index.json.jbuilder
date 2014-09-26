json.array!(@job_applications) do |job_application|
  json.extract! job_application, :id, :job_id, :user_id, :cover_letter, :status_id
  json.url job_application_url(job_application, format: :json)
end
