require 'rails_helper'

feature 'create and manipulate items', js: true do
  scenario 'create item and delete after'  do
    login_without_registration("helena.wu87@gmail.com","helloworld")
    create_item('first todo item!')
    # item = Item.find_by(description: 'first todo item!')
    # click_link "item-{item.id}"
    click_link 'delete'
    expect(page).not_to have_text 'Description: first todo item!'
  end
  scenario 'mark todo item as completed' do
    login_without_registration("helena.wu87@gmail.com","helloworld")
    create_item('first todo item!')
    click_link 'Check as complete'
    expect(page).to have_text 'Completion: true'
  end
end

