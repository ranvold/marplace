require 'rails_helper'

describe 'Seller', type: :feature do
  it 'signs me in' do
    login_as(create(:seller, email: 'auth@gmail.com', password: 'mypassword'))

    visit '/sellers/sign_in'
    within('div.card-body') do
      fill_in 'Email', with: 'auth@gmail.com'
      fill_in 'Password', with: 'mypassword'
    end

    within('div.actions') do
      click_button 'Sign in'
    end

    expect(page).to have_content 'successfully'
  end

  it 'doesnt sign me in' do
    login_as(create(:seller, email: 'auth@gmail.com', password: 'mypassword'))

    visit '/sellers/sign_in'
    within('div.card-body') do
      fill_in 'Email', with: 'mistake@gmail.com'
      fill_in 'Password', with: 'mypassword'
    end

    within('div.actions') do
      click_button 'Sign in'
    end

    expect(page).to have_content 'Invalid Email or password'
  end
end
