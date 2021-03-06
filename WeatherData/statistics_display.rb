require_relative "weather_data"

class StatisticsDisplay
  attr_accessor :max_temp, :min_temp, :temp_sum, :num_readings, :weather_data

  # @param weather_data [WeatherData]
  def initialize (max_temp = 0.0, min_temp = 200, temp_sum = 0.0, num_readings = 0, weather_data)
    @max_temp = max_temp
    @min_temp = min_temp
    @temp_sum  = temp_sum
    @num_readings = num_readings
    @weather_data = weather_data
    @weather_data.register_observer(self)
  end

  def show()
    puts "Avg/Max/Min temperature = #{@temp_sum / @num_readings}/#{@max_temp}/#{@min_temp}"
  end

  def update(temperature, humidity, pressure)
    @temp_sum += temperature
    @num_readings += 1

    if temperature > @max_temp
      @max_temp = temperature
    end

    if temperature < min_temp
      @min_temp = temperature
    end

    show
  end
end