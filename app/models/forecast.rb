class Forecast < ApplicationRecord
  scope :historical, -> {
    find_by_sql("SELECT * FROM forecasts ORDER BY epoch_time DESC LIMIT 24")
  }

  scope :current_temperature, -> {
    find_by_sql("SELECT temperature FROM forecasts ORDER BY epoch_time DESC LIMIT 1").first.temperature
  }

  scope :historical_max, -> {
    find_by_sql("SELECT MAX(temperature) as max_temperature FROM
      (SELECT * FROM forecasts ORDER BY epoch_time DESC LIMIT 24) as recent_forecasts").first.max_temperature
  }

  scope :historical_min, -> {
    find_by_sql("SELECT MIN(temperature) as min_temperature FROM
      (SELECT * FROM forecasts ORDER BY epoch_time DESC LIMIT 24) as recent_forecasts").first.min_temperature
  }

  scope :historical_avg, -> {
    find_by_sql("SELECT AVG(temperature) as avg_temperature FROM
      (SELECT * FROM forecasts ORDER BY epoch_time DESC LIMIT 24) as recent_forecasts").first.avg_temperature
  }

  def self.find_by_closest_time(timestamp)
    time = Time.at(timestamp)

    where('epoch_time BETWEEN ? AND ?', time - 1.hour, time + 1.hour)
      .order(Arel.sql("ABS(extract(epoch from epoch_time) - #{timestamp})"))
      .first
  end
end


class Forecast < ApplicationRecord
  scope :historical, -> { order(epoch_time: :desc).limit(24) }
  scope :current_temperature, -> { order(epoch_time: :desc).first.temperature }
  scope :historical_max, -> { historical.maximum(:temperature) }
  scope :historical_min, -> { historical.minimum(:temperature) }
  scope :historical_avg, -> { historical.average(:temperature) }

  def self.find_by_closest_time(timestamp)
    time = Time.at(timestamp)

    where('epoch_time BETWEEN ? AND ?', time - 1.hour, time + 1.hour)
      .order(Arel.sql("ABS(extract(epoch from epoch_time) - #{timestamp})"))
      .first
  end
end
