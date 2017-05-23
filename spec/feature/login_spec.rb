require 'rails_helper'

RSpec.describe "Login", :type => :feature do

    describe "the signin process", :type => :feature do
      before :each do
        User.create(email: 'user@example.com', password: 'password')
      end

      it "signs me in" do
        visit '/users/sign_in'
        within("#new_user") do
          fill_in 'Email', with: 'user@example.com'
          fill_in 'Password', with: 'password'
        end
        click_button 'Login'
        expect(page).to have_css('body > div > div.alert.alert-info')
        expect(page).to have_content 'Login efetuado com sucesso!'
      end
    end
end