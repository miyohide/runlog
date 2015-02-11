json.array!(@runrecords) do |runrecord|
  json.extract! runrecord, :id, :runned_at, :distance, :run_time
  json.url runrecord_url(runrecord, format: :json)
end
