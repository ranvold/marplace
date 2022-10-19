require 'rails_helper'

describe 'User', type: :feature do
  it 'signs me in' do
    create(:user, email: 'auth@gmail.com', password: 'mypassword')

    visit '/users/sign_in'
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
    create(:user, email: 'auth@gmail.com', password: 'mypassword')

    visit '/users/sign_in'
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
