class BuildLocationArray

  def build_locations(breweries)
    location_array = []

    breweries.each do |brewery|
      brewery_array = []
      brewery_array.push(
        brewery.name.gsub("'", %q(\\\')),
        brewery.latitude,
        brewery.longitude
      )
      location_array << brewery_array
    end
    location_array
  end
end
