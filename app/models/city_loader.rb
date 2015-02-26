class CityLoader
  def initialize(state)
    @state = state
  end

  def get_cities
    cities = []
    @states.each do |state|
      breweries = state.breweries
        breweries.each do |brewery|
          if brewery.city
            cities << brewery.city
          end
        end
    end
  end


  # Problem: need foreign key association here. Maybe call in brewery loader?
  # Also need to set up cit
  def load_cities
    cities = get_cities

    @states.each do |state|
      breweries = state.breweries
        breweries.each do |brewery|
          if brewery.city
            City.create(name: brewery.city)
          end
        end
    end
  end



end
