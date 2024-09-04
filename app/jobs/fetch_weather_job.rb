class FetchWeatherJob < ApplicationJob
  queue_as :default

  def perform
    AccuweatherService.call
  end
end
