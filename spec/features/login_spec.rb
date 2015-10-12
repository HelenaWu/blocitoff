require 'rails_helper'


feature 'access Todo app' do

  scenario 'sign up for an account' do
    visit '/'
    click_link('sign up!')
    fill_in 'Email', with: 'test@example.org'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'

    click_button "Sign up"
    expect(page).to have_content "Welcome#index"

    open_email "test@example.org"
    current_email.click_link "Confirm my account"
    expect(page).to have_content "Log in"
    login_with_prior_registration('test@example.org', 'helloworld')
    expect(page).to have_text 'User information'
  end

  scenario 'success then log out'  do
    login_without_registration("helena.wu87@gmail.com","helloworld")
    expect(page).to have_text 'User information'
    click_link('back')
    click_link('sign out')
    expect(page).to have_text 'existing user?'
  end


end