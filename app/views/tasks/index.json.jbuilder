json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :status, :story_id
  json.url task_url(task, format: :json)
end
