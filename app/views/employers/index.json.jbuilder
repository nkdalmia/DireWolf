json.array!(@employers) do |employer|
  json.extract! employer, :id, :company_name, :contact_name, :email
  json.url employer_url(employer, format: :json)
end
