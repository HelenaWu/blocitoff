def login_without_registration(email, password)
    create(:user, email: email, password: password)
    visit root_path
    click_link('existing user?')
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button('Log in')
end

def login_with_prior_registration(email, password)
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button('Log in')
end
 
def create_item(description)
    click_link 'new item'
    expect(page).to have_text 'Description'
    fill_in 'Description', with: description
    click_button 'Create Item'
    expect(page).to have_text description
end