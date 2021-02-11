json.extract! client, :id, :surname, :forename, :middle_name, :birthday, :phone, :password, :created_at, :updated_at
json.url client_url(client, format: :json)
