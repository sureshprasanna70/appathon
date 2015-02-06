json.array!(@hooks) do |hook|
  json.extract! hook, :id, :name, :token, :purpose
  json.url hook_url(hook, format: :json)
end
