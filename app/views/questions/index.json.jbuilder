json.array!(@questions) do |question|
  json.extract! question, :id, :total_taken, :yes, :no
  json.url question_url(question, format: :json)
end
