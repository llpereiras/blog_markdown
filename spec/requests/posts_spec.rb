require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    it "Fazendo login e " do
      user = FactoryGirl.build(:user)
      sign_in user
      visit posts_path
      expect(page).to have_current_path(posts_path)
      expect(page).to have_current_path(posts_path)
      expect(page).to have_content 'Novo Post'
    end

    it 'Esperava-se um 401 (Not Autorizated) mas o devise está retornando 302 quando não envia o usuario' do
      get posts_path
      expect(response).to have_http_status(302)
    end

  end
end
