class CityLoader
  def initialize(city, state)
    @state = state
    @city = city
  end

  def load_city
    # problem: dealing with existing city
    City.find_or_create_by(
      name: @city,
      state_id: @state.id
    )
  end

  # NOT RUN. Use with alternative architecture
  # def get_cities
  #   cities = []
  #   @states.each do |state|
  #     breweries = state.breweries
  #       breweries.each do |brewery|
  #         if brewery.city
  #           cities << brewery.city
  #         end
  #       end
  #   end
  # end
  #
  #
  # def load_cities
  #   cities = get_cities
  #
  #   @states.each do |state|
  #     breweries = state.breweries
  #       breweries.each do |brewery|
  #         if brewery.city
  #           City.create(name: brewery.city)
  #         end
  #       end
  #   end
  # end
end
