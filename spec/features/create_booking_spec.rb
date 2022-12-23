require 'rails_helper'

RSpec.describe 'Creating a booking', type: :feature do
  scenario 'valid inputs' do
    visit new_booking_path
    fill_in 'First Name', with: 'Max'
    click_on 'Create Booking'
    visit admin_path
    expect(page).to have_content('Minneapolis')
  end
end