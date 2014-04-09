json.array!(@array_of_stories) do |story|
  json.extract! story, :id, :description, :sprint_id, :project_id, :title, :status
  json.url story_url(story, format: :json)
end
