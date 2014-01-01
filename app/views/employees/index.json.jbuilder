json.array!(@employees) do |employee|
  json.cache! employee do
    json.extract! employee, :id, :first_name, :last_name, :email, :start_date
  end
end