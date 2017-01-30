require 'rails_helper'
require 'capybara/rspec'

feature 'User signs in' do

  before  { @user = User.create(name: 'Paul', email:'user@example.com', password: '123456', telephone: '+79780000000') }

  def sign_in(email, password)
    visit sign_in_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end

  scenario 'sign in with valid email and password' do
    sign_in @user.email, @user.password
    expect(page).to have_content('Sign out')
  end

  scenario 'sign in with invalid email' do
    sign_in 'fail', @user.password
    expect(page).to have_content('Invalid')
  end

  scenario 'sign in with invalid password' do
    sign_in @user.email, '12345678'
    expect(page).to have_content('Invalid')
  end

end