json.array!(@tools) do |tool|
  json.extract! tool, :id, :name, :price, :quantity
  json.url tool_url(tool, format: :json)
end
