Rails.application.config.after_initialize do
  FetchWeatherJob.perform_later if Rails.env.development?
end
