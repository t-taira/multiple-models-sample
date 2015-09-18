json.array!(@store_settings) do |store_setting|
  json.extract! store_setting, :id, :name, :store_name
  json.url store_setting_url(store_setting, format: :json)
end
