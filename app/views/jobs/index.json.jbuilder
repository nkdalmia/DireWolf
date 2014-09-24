json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :employer_id, :category_id, :deadline, :public
  json.url job_url(job, format: :json)
end
