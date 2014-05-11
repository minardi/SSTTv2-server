if @backlog_item
  json.extract! @backlog_item, :id, :title, :description, :estimation, :parent_id, :status, :item_type
  
  json.start_date @backlog_item.info["start_date"]
  json.end_date @backlog_item.info["end_date"]
  json.url backlog_item_url(@backlog_item, format: :json)
end