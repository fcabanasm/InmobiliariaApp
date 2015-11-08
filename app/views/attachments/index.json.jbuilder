json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :name, :extension, :apartment_id
  json.url attachment_url(attachment, format: :json)
end
