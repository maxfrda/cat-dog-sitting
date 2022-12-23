# frozen_string_literal: true

class Booking < ApplicationRecord
  enum animal_type: { dog: 0, cat: 1 }

  validates :first_name, :last_name, :animal_name, :animal_type,
            :date_of_service, :hours_requested, presence: true
end
