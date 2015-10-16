require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

     url =  "https://api.forecast.io/forecast/b4d4628d42405e344f38b1bfe590b576/#{@lat},#{@lng}"

    parsed_data = JSON.parse(open(url).read)
    temp = parsed_data["currently"]["temperature"]
    summary = parsed_data["currently"]["summary"]
    sixtysummary = parsed_data["minutely"]["summary"]
    severalhourssummary = parsed_data["hourly"]["summary"]
    severaldayssummary = parsed_data["daily"]["summary"]



    @current_temperature = temp

    @current_summary = summary

    @summary_of_next_sixty_minutes = sixtysummary

    @summary_of_next_several_hours = severalhourssummary

    @summary_of_next_several_days = severaldayssummary

    render("coords_to_weather.html.erb")
  end
end
