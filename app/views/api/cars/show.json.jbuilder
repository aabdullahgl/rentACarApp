json.car do
  json.id @car.id
  json.daily_price @car.daily_price
  json.model_year @car.model_year
  json.status @car.status
  json.model @car.model
  json.brand @car.model.brand
end
