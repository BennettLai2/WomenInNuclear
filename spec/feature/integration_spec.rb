# location: spec/feature/integration_spec.rb
require 'rails_helper'
def createUser
  visit root_path 
    click_on 'Sign Up'
    fill_in 'user_first_name', with: 'test'
    fill_in 'user_last_name', with: 'user'
    fill_in 'user_email', with: 'abc@gmail.com'
    fill_in 'user_password', with: 'abcdef'
    fill_in 'Password confirmation', with: 'abcdef'
    click_on 'Sign up'
end

def createAdmin
  visit root_path 
    click_on 'Sign Up'
    fill_in 'user_first_name', with: 'test'
    fill_in 'user_last_name', with: 'user'
    fill_in 'user_email', with: 'admin@gmail.com'
    fill_in 'user_password', with: 'abcdef'
    fill_in 'Password confirmation', with: 'abcdef'
    click_on 'Sign up'
end
=begin 
RSpec.describe 'Logging into a fake account', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'abc@gmail.com'
    fill_in 'Password', with: 'abc'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end

RSpec.describe 'Creating and Logging into a real account', type: :feature do
  scenario 'valid inputs' do
    createUser
    expect(page).to have_content('Welcome! You have signed up successfully.')                               
  end
end

RSpec.describe 'Creating and Logging in with Wrong Password', type: :feature do
  scenario 'valid inputs' do
    createUser
    click_on 'Sign Out'
    click_on 'Sign In'
    fill_in 'Email', with: 'abc@gmail.com'
    fill_in 'Password', with: 'fedcba'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end
=end

=begin
RSpec.describe 'Creating and Logging in as a normal user', type: :feature do
  scenario 'valid inputs' do
    createUser
    click_on 'Sign Out'
    click_on 'Sign In'
    fill_in 'Email', with: 'abc@gmail.com'
    fill_in 'Password', with: 'abcdef'
    click_on 'Log in'
    expect(page).to have_content('regular')
  end
end

RSpec.describe 'Creating an account with an email already in use', type: :feature do 
  scenario 'valid inputs' do 
    createUser
    click_on 'Sign Out'
    click_on 'Sign Up'
    createUser
    click_on 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end
end

RSpec.describe 'Creating and Logging in with Wrong Username', type: :feature do
    scenario 'valid inputs' do
    createUser
    click_on 'Sign Out'
    click_on 'Sign In'
    fill_in 'Email', with: 'abcde@gmail.com'
    fill_in 'Password', with: 'abcdef'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password')
    end
  end

RSpec.describe 'Updating first name', type: :feature do
    scenario 'valid inputs' do
    createUser
    click_on 'Edit Profile'
    fill_in 'user_first_name', with: 'Taylor'
    fill_in 'Current password', with: 'abcdef'
    click_on 'Update'
    expect(page).to have_content('Taylor user') 
    end
  end

RSpec.describe 'Canceling user account', type: :feature do
    scenario 'valid inputs' do
    createUser
    click_on 'Edit Profile'
    click_on "Cancel my account"
    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.') 
    end
  end

RSpec.describe 'Admin makes another user admin', type: :feature do
    scenario 'valid inputs' do
    createUser
    click_on 'Sign Out'
    createAdmin
    click_link("Make Admin", :match => :first)
    click_on 'Sign Out'
    click_on 'Sign In'
    fill_in 'Email', with: 'admin123@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('admin')
    end
  end

RSpec.describe 'Admin point reset', type: :feature do
    scenario 'valid inputs' do
    createAdmin
    click_on 'Reset Points'
    fill_in 'Enter Email', with: 'admin123@gmail.com'
    click_on 'Reset Points'
    expect(page).not_to have_content('Operation Failed: Email is incorrect, points have not been changed')
    end
  end
=end

#PROBLEMATIC!!
=begin
RSpec.describe 'User attends an event and earns points', type: :feature do
  scenario 'valid inputs' do
  createAdmin
  click_on 'View Events'
  click_on 'New Event'
  fill_in 'event_points', with: '5'
  
 
  fill_in 'event_meeting_name', with: 'First meeting'
  fill_in 'event_start_time', with: '2023-12-04 09:30:00'
  fill_in 'event_end_time', with: '2023-12-04 10:30:00'
  fill_in 'event_description', with: 'First meeting of the semester!'
  click_on 'Create Event'

  createUser
  click_on 'Edit Profile'
  click_on "Cancel my account"

  expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.') 
  end
end
=end