json.brand do
  json.id @brand.id
  json.name @brand.name
  if ((defined? @brand.brand_image) && (@brand.brand_image.filename!= nil))
    json.brand_image rails_blob_url(@brand.brand_image)
  end
end
