json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :area, :proficiency, :available
  json.url employee_url(employee, format: :json)
end
