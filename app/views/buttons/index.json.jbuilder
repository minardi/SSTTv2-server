json.array!(@buttons) do |button|
  json.extract! button, :id, :content, :glyph, :show_only, :show_except
  json.url button_url(button, format: :json)
end
