json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :title, :description, :project_id, :start, :finish, :status
  json.url sprint_url(sprint, format: :json)
end
