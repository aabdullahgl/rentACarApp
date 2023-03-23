json.brand do
  json.id @brands.id
  json.name @brands.name
  json.image rails_blob_url(@brands.brand_image)



end
