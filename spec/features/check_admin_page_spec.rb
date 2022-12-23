# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checking admin pages from home page', type: :feature do
  scenario 'when there are bookings' do
    Booking.create(
      first_name: 'Max',
      last_name: 'Arellano',
      animal_name: 'Shadow',
      animal_type: 'dog',
      date_of_service: '2022-12-22',
      hours_requested: '2',
      cost: '40'
    )

    visit root_path
    find('a[class="cta admin"]').click
    expect(page).to have_css('.card')
    expect(page).to have_content('Max')
    expect(page).to have_content('Arellano')
    expect(page).to have_content('Shadow')
    expect(page).to have_content('Dog')
    expect(page).to have_content('12/22/22')
    expect(page).to have_content('Hours Req')
    expect(page).to have_content('$40')
  end

  scenario 'when there are no bookings' do
    visit root_path
    find('a[class="cta admin"]').click

    expect(page).to_not have_css('.card')
  end
end
