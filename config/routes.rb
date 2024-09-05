Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get "/weather/historical/min", to: "api/v1/accuweather#historical_min"
  get "/weather/historical/max", to: "api/v1/accuweather#historical_max"
  get "/weather/historical/avg", to: "api/v1/accuweather#historical_avg"
  get "/weather/current", to: "api/v1/accuweather#current"
  get "/weather/historical", to: "api/v1/accuweather#historical"
  get "/weather/by_time", to: "api/v1/accuweather#by_time"
  get "/health", to: "api/v1/accuweather#health"
end
