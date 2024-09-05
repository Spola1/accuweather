Rails.application.config.after_initialize do
  FetchWeatherJob.perform_now if Rails.env.development?
end
