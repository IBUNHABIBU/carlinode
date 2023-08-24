class CarRepresenter
  def initialize(car)
    @car = car
  end

  def as_json
    {
      id: car.id,
      color: car.color,
      engine: car.engine,
      year: car.year,
      title: car.title,
      price: car.price,
      description: car.description,
      imageUrl: car.imageUrl
    }
  end

  private

  attr_reader :car
end
