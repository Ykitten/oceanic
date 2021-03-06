require 'spec_helper'

describe 'Users' do

  describe 'GET /' do
    it 'displays a register link' do
      visit root_path
      page.should have_link('Register')
    end
  end

  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link('Register')
      fill_in('user_name', :with => 'Bob')
      fill_in('user_email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create Account')
      page.should_not have_content('Create Account')
      expect(User.first.name).to eq 'Bob'
    end
  end


  describe 'JS cancel_registration_form()' do
    it 'removes the registration forms', :js => true do
      visit root_path
      click_link('Register')
      click_link('Cancel')
      page.should_not have_content('Create Account')
    end
  end
end