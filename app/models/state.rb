class State < ActiveRecord::Base
  def initialize(name)
    @name = name
  end
end
