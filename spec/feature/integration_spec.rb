# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Logging into a fake account', type: :feature do
  scenario 'valid inputs' do
    visit login_path
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'abc'
    click_on 'Login'

    expect(page).to have_content('Error')
  end
end

RSpec.describe 'Creating and Logging into a real account', type: :feature do
  scenario 'valid inputs' do
    visit new_account_path 
    fill_in 'account_first_name', with: 'test'
    fill_in 'account_last_name', with: 'user'
    fill_in 'account_email', with: 'abc@gmail.com'
    fill_in 'account_password', with: 'abc'
    fill_in 'account_points', with: '0' 
    click_on 'Create Account'
    visit login_path
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'abc'
    click_on 'Login'
    expect(page).to have_content('test')
  end
end

RSpec.describe 'Creating and Logging with Wrong Password', type: :feature do
  scenario 'valid inputs' do
    visit new_account_path 
    fill_in 'account_first_name', with: 'test'
    fill_in 'account_last_name', with: 'user'
    fill_in 'account_email', with: 'abc@gmail.com'
    fill_in 'account_password', with: 'abcde'
    fill_in 'account_points', with: '0' 
    click_on 'Create Account'
    visit login_path
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'abc'
    click_on 'Login'
    expect(page).to have_content('Error')
  end
end

RSpec.describe 'Creating and Logging as Admin', type: :feature do
  scenario 'valid inputs' do
    visit new_account_path 
    fill_in 'account_first_name', with: 'test'
    fill_in 'account_last_name', with: 'user'
    fill_in 'account_email', with: 'admin@gmail.com'
    fill_in 'account_password', with: 'abcde'
    fill_in 'account_points', with: '0' 
    find("label[for='account_admin']").click
    click_on 'Create Account'
    visit login_path
    fill_in 'email', with: 'admin@gmail.com'
    fill_in 'password', with: 'abcde'
    click_on 'Login'
    expect(page).to have_content('Admin')
  end
end

RSpec.describe 'Creating and Logging not as a normal user', type: :feature do
  scenario 'valid inputs' do
    visit new_account_path 
    fill_in 'account_first_name', with: 'test'
    fill_in 'account_last_name', with: 'user'
    fill_in 'account_email', with: 'normaluser@gmail.com'
    fill_in 'account_password', with: 'abcde'
    fill_in 'account_points', with: '0' 
    click_on 'Create Account'
    visit login_path
    fill_in 'email', with: 'normaluser@gmail.com'
    fill_in 'password', with: 'abcde'
    click_on 'Login'
    expect(page).to have_content('normal')
  end
end