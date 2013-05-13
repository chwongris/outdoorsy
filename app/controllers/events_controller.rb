class EventsController < ApplicationController


  def index

    @restaurants = []
    @meetups = []
    @parks = []
  end

  def create

    searchterm = params[:searchterm]
    result = request.location
    ipcity = result.data["city"]
    latlng = []

      if ipcity == ""
      latlng = Geocoder.coordinates("#{searchterm}, New York")
      else
      latlng = Geocoder.coordinates("#{searchterm}, #{ipcity}")
      end

  latitude = latlng[0]
  longitude = latlng[1]
  @restaurants = Restaurant.outdoor_restaurant_search(latitude,longitude)
  @meetups = Meetup.get_event("hiking",latitude,longitude)
  @parks = OutdoorArea.near([latitude, longitude], 0.5)
  # binding.pry
  render :template => 'events/search', :content_type => 'text/javascript'

  end



  def newday
    @event = Event.new
    @restaurants = Restaurant.new
    render :template => 'events/createevent', :content_type => 'text/javascript'
  end 

end
