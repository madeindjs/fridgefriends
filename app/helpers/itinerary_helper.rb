module ItineraryHelper
  def google_maps_itinerary(address)
    uri = URI.parse('https://www.google.com/maps/dir/')
    query_string = URI.encode_www_form(
      api: 1,
      travelmode: 'walking',
      destination: address
    )
    uri.query = query_string
    uri.to_s
  end
end
