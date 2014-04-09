json.array!(@stories) do |story|
  json.extract! story, :id, :title, :description, :project_id, :status, :sprint_id
  json.url story_url(story, format: :json)
end
