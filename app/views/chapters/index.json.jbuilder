json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :course_id, :name, :order_number
  json.url chapter_url(chapter, format: :json)
end
