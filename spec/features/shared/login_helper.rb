module LoginHelper
  def login_to_system(user)
    click_link('Login')
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => user.password)
    click_button('Get LOST')
  end
end