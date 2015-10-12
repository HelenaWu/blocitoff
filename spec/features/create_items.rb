require 'rails_helper.rb'

feature 'create and manipulate items' do
  scenario 'create item and delete after'  do
    login_without_registration("helena.wu87@gmail.com","helloworld")
    click_link 'new item'
    expect(page).to have_text 'Description'
    fill_in 'Description', with: 'first todo item!'
    click_button 'Create Item'
    expect(page).to have_text 'Description: first todo item!'
    #how to select the correct item?by div id= 'id-#{item.id}'?

  end
  scenario 'mark todo item as completed' do
    #how to select item?
  end
end