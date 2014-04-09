json.array!(@array_of_tasks) do |task|
  json.extract! task, :id,  :description, :story_id, :title, :status
  json.url task_url(task, format: :json)
end
