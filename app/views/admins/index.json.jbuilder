json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :username, :email, :encrypted_password
  json.url admin_url(admin, format: :json)
end
