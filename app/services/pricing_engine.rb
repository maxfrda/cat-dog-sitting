# frozen_string_literal: true

class PricingEngine
  def initialize(animal_type:, hours_requested:)
    @animal_type = animal_type
    @hours_requested = hours_requested
    @base_charge = 20
  end

  def determine_cost
    case @animal_type
    when 'dog'
      (10 * @hours_requested) + @base_charge
    when 'cat'
      (5 * @hours_requested) + @base_charge
    end
  end
end
