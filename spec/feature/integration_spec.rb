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

def signinAdmin
  visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: "admin123@gmail.com"
    fill_in 'Password', with: '123456'
    click_on 'Log in'
end

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

RSpec.describe 'Default Admin Login', type: :feature do
  scenario 'valid inputs' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: "admin123@gmail.com"
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Admin')
  end
end

  RSpec.describe 'Admin create Milestone', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Milestones'
      click_on 'New Milestone'
      fill_in 'Name', with: 'milestone1'
      fill_in 'Points', with: 3
      fill_in 'Message', with: 'Hello message'
      click_on 'Submit'
      expect(page).to have_content('Milestone was successfully created.')
    end
  end
  
  RSpec.describe 'Admin view Milestone', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Milestones'
      click_on 'New Milestone'
      fill_in 'Name', with: 'milestone1'
      fill_in 'Points', with: 3
      fill_in 'Message', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'Show'
      expect(page).to have_content('milestone1')
      expect(page).to have_content('3')
      expect(page).to have_content('Hello message')
    end
  end
  
  RSpec.describe 'Admin edit Milestone', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Milestones'
      click_on 'New Milestone'
      fill_in 'Name', with: 'milestone1'
      fill_in 'Points', with: 3
      fill_in 'Message', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'Edit'
      fill_in 'Name', with: 'milestoneNew'
      click_on 'Submit'
      expect(page).to have_content('Milestone was successfully updated.')
    end
  end
  
  RSpec.describe 'Admin delete Milestone', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Milestones'
      click_on 'New Milestone'
      fill_in 'Name', with: 'milestone1'
      fill_in 'Points', with: 3
      fill_in 'Message', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'Destroy'
      expect(page).to have_content('Milestone was successfully destroyed.')
      expect(page).not_to have_content('MilestoneNew')
    end
  end


  RSpec.describe 'Admin create Event', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Events'
      click_on 'New Event'
      fill_in 'Meeting name', with: 'event1'
      fill_in 'Points', with: 3
      fill_in 'Description', with: 'Hello message'
      click_on 'Submit'
      expect(page).to have_content('Event was successfully created.')
    end
  end
  
  RSpec.describe 'Admin view Event', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Events'
      click_on 'New Event'
      fill_in 'Meeting name', with: 'event1'
      fill_in 'Points', with: 3
      fill_in 'Description', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'event1'
      expect(page).to have_content('event1')
      expect(page).to have_content('3')
      expect(page).to have_content('Hello message')
    end
  end
  
  RSpec.describe 'Admin edit Event', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Events'
      click_on 'New Event'
      fill_in 'Meeting name', with: 'event1'
      fill_in 'Points', with: 3
      fill_in 'Description', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'Edit'
      fill_in 'Meeting name', with: 'eventNew'
      click_on 'Submit'
      expect(page).to have_content('Event was successfully updated.')
    end
  end
  
  RSpec.describe 'Admin delete Event', type: :feature do
    scenario 'valid inputs' do
      signinAdmin
      click_on 'View Events'
      click_on 'New Event'
      fill_in 'Meeting name', with: 'event1'
      fill_in 'Points', with: 3
      fill_in 'Description', with: 'Hello message'
      click_on 'Submit'
      click_on 'Back'
      click_on 'Destroy'
      expect(page).to have_content('Event was successfully destroyed.')
      expect(page).not_to have_content('eventNew')
    end
  end

