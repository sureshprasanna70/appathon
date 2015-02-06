json.array!(@bugs) do |bug|
  json.extract! bug, :id, :name, :desc, :assigned_to
  json.url bug_url(bug, format: :json)
end
