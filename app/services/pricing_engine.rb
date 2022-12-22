class PricingEngine
  def initialize(animal_type:, hours_requested:)
    @animal_type = animal_type
    @hours_requested = hours_requested
    @base_charge = 20
  end

  def determine_cost
    if @animal_type == 'dog'
      return  (10 * @hours_requested) + @base_charge
    elsif @animal_type == 'cat'
      return (5 * @hours_requested) + @base_charge
    end
  end
end