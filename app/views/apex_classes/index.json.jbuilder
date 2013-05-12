json.array!(@apex_classes) do |apex_class|
  json.extract! apex_class, 
  json.url apex_class_url(apex_class, format: :json)
end