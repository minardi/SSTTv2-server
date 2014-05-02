json.array!(@backlog_items) do |backlog_item|
  json.extract! backlog_item, :id, :title, :description, :estimation, :parent_id, :status, :item_type

  if backlog_item.item_type == "sprint"
    json.start_date backlog_item.info["start_at"]
    json.end_date backlog_item.info["end_at"]
  end
  
  json.url backlog_item_url(backlog_item, format: :json)
end
