# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a booking from home page', type: :feature do
  scenario 'With valid inputs' do
    visit root_path
    find('a[class="cta book"]').click

    fill_in :booking_first_name, with: 'Max'
    fill_in :booking_last_name, with: 'Arellano'
    fill_in :booking_animal_name, with: 'Shadow'
    fill_in :booking_date_of_service, with: '2022-12-23'
    fill_in :booking_hours_requested, with: '3'
    choose(:booking_animal_type_dog)

    find('input[name="commit"]').click

    expect(page).to have_content('Booked successfully. Your total is $50')
    visit admin_path
    expect(page).to have_css('.card')
  end

  scenario 'With invalid inputs' do
    visit root_path
    find('a[class="cta book"]').click

    find('input[name="commit"]').click

    expect(page).to have_content('Your booking could not be completed')
  end
end
