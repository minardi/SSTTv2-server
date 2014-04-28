json.array!(@permissions) do |permission|
  json.extract! permission, :id, :button_id, :page, :right
  json.url permission_url(permission, format: :json)
end
