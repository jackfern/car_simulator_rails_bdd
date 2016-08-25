require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do

  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and model year and color' do
        fill_in 'make', with: 'DeLorean'
        fill_in 'year', with: '1985'
        fill_in 'color', with: '#000000'
      end
      And 'I submit the information' do
        click_button 'Create new car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_css('span.color')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0km/h')
      end
      And 'I can see the light status' do
        expect(page).to have_content('Lights: off')
      end
    end
  end

  context 'Simulating a car' do
   Steps 'Speeding up a car' do
     Given 'I have created a car' do
       visit '/'
       fill_in 'make', with: 'DeLorean'
       fill_in 'year', with: '1985'
       click_button 'Create new car'
     end
     Then "the car's speed is 0Km/h" do
       expect(page).to have_content('Speed: 0km/h')
     end
     When "I can click the accelerate button" do
       click_button 'Accelerate'
     end
     Then 'the speed of the car should be 10Km/h higher' do
       expect(page).to have_content('Speed: 10km/h')
     end
     When "I can click the accelerate button" do
       click_button 'Accelerate'
     end
     Then 'the speed of the car should be 10Km/h higher' do
       expect(page).to have_content('Speed: 20km/h')
     end
     When "I can click the brake button" do
       click_button 'Brake'
     end
     Then 'the speed of the car should decrease by 7 km/h' do
       expect(page).to have_content('Speed: 13km/h')
     end
     When "I can click the brake button" do
       click_button 'Brake'
     end
     Then 'the speed of the car should decrease by 7 km/h' do
       expect(page).to have_content('Speed: 6km/h')
     end
     When "I can click the brake button" do
       click_button 'Brake'
     end
     Then 'the speed of the car should decrease to 0km/h' do
       expect(page).to have_content('Speed: 0km/h')
     end
     When "I can click the brake button" do
       click_button 'Brake'
     end
     Then 'the speed of the car should decrease to 0km/h' do
       expect(page).to have_content('Speed: 0km/h')
     end
     When "I can click the lights button" do
       click_button 'Lights'
     end
     Then 'the lights will toggle on or off' do
       expect(page).to have_content('Lights: on')
     end
     When 'I can click the lights button' do
       click_button 'Lights'
     end
     Then 'the lights will toggle on or off' do
       expect(page).to have_content('Lights: off')
     end
     When 'I can click the radio buttons and submit' do
       choose 'Set'
       click_button 'Change parking brake'
     end
     Then 'the parking brake will set' do
       expect(page.find_by_id('Set')).to be_checked
     end
     When 'I can click the radio buttons and submit' do
       choose 'Release'
       click_button 'Change parking brake'
     end
     Then 'the parking brake will release' do
       expect(page.find_by_id('Release')).to be_checked
     end
     When 'I can click the radio buttons and submit, then try to accelerate' do
       choose 'Set'
       click_button 'Change parking brake'
       click_button 'Accelerate'
     end
     Then 'the parking brake will set, and speed does not increase' do
       expect(page.find_by_id('Set')).to be_checked
       expect(page).to have_content('Speed: 0km/h')
     end
     When 'I can click the radio buttons and submit' do
       choose 'Release'
       click_button 'Change parking brake'
     end
     Then 'the parking brake will release' do
       expect(page.find_by_id('Release')).to be_checked
     end
     When "I can click the accelerate button" do
       click_button 'Accelerate'
     end
     Then 'the speed of the car should be 10Km/h higher' do
       expect(page).to have_content('Speed: 10km/h')
     end
     When 'I can click the radio buttons and submit' do
       choose 'Set'
       click_button 'Change parking brake'
     end
     Then 'the parking brake will set, and speed does not increase' do
       expect(page.find_by_id('Release')).to be_checked
       expect(page).to have_content('Speed: 10km/h')
     end
   end
 end

end
