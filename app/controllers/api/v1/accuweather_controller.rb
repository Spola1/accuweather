module Api
  module V1
    class AccuweatherController < ApplicationController
      def current
        temperature = Forecast.current_temperature
        render json: { temperature: temperature }
      end

      def historical
        temperatures = Forecast.historical.pluck(:temperature)
        render json: { temperatures: temperatures }
      end

      def historical_max
        temperature = Forecast.historical_max
        render json: { temperature: temperature }
      end

      def historical_min
        temperature = Forecast.historical_min
        render json: { temperature: temperature }
      end

      def historical_avg
        temperature = Forecast.historical_avg
        render json: { temperature: temperature }
      end

      def health
        render json: { status: 'OK' }, status: :ok
      end

      def by_time
        timestamp = params[:timestamp].to_i
        forecast = Forecast.find_by_closest_time(timestamp)

        if forecast.present?
          render json: { temperature: forecast.temperature }
        else
          render json: { error: 'No forecast found within one hour of the given timestamp' }, status: :not_found
        end
      end
    end
  end
end
