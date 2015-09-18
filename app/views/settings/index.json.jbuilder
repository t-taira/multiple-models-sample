json.array!(@settings) do |setting|
  json.extract! setting, :id, :name
  json.url setting_url(setting, format: :json)
end
