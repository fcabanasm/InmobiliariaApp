json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :description, :image, :cover, :apartment_id
  json.url picture_url(picture, format: :json)
end
