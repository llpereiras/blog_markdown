require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #root_path" do

    it "Espera-se que a resposta seja success" do
      expect(response).to be_success
    end

    it "Espera-se que o status da respota seja 200" do
      expect(response).to have_http_status(200)
    end

    it "Espar-se que seja listados os posts publicados" do
      post = FactoryGirl.create(:post_publicado)
      get :inicio, params: {}
      expect(assigns(:posts)).to eq([post])
    end

  end

end
