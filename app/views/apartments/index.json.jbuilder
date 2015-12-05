json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :cod_apartment, :title, :description, :user_id, :is_rented, :rooms, :bathrooms, :pernightPrice
  json.url apartment_url(apartment, format: :json)
end
