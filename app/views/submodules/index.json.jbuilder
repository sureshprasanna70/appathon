json.array!(@submodules) do |submodule|
  json.extract! submodule, :id, :name, :desc, :deadline, :score
  json.url submodule_url(submodule, format: :json)
end
