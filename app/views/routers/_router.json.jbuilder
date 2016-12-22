json.extract! router, :id, :numPorts, :test, :serialNum, :description, :created_at, :updated_at
json.url router_url(router, format: :json)