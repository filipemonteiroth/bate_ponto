json.array!(@work_points) do |work_point|
  json.extract! work_point, :id, :entrada, :almoco, :volta_almoco, :saida
  json.url work_point_url(work_point, format: :json)
end
