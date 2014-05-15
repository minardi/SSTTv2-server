json.array!(@permissions) do |permission|
  json.extract! permission, :id, :allowed_for, :denied_for, :dash_button_id
  json.url permission_url(permission, format: :json)
end
