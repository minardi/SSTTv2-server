json.array!(@dash_buttons) do |dash_button|
  json.extract! dash_button, :id, :btn_content, :btn_type
  json.url dash_button_url(dash_button, format: :json)
end
