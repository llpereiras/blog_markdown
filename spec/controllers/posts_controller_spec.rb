require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:invalid_attributes) { FactoryGirl.attributes_for(:post_invalido) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:post_nao_publicado) }

  describe "GET #index" do
    it "Espera-se all posts as @posts" do
      post = FactoryGirl.create(:post_nao_publicado)
      get :index, params: {}, session: login
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "Espera-se que seja listado um post específico" do
      post = FactoryGirl.create(:post_nao_publicado)
      get :show, params: {id: post.id}, session: login
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "com parametros validos" do
      it "Criar um novo Post" do
        expect {
          post :create, params: {post: valid_attributes}, session: login
        }.to change(Post, :count).by(1)
      end

      it "Espera-se que possa ser criado um @post" do
        post :create, params: {post: valid_attributes}, session: login
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "Espera-se que seja redirecionado para o post criado" do
        post :create, params: {post: valid_attributes}, session: login
        expect(response).to redirect_to(posts_path)
      end
    end

    context "with invalid params" do
      it "Espera-se que um tentativa de criar um post não seja salva" do
        post :create, params: {post: {titulo: ''}}, session: login
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "Renderiza novamente o template 'new'" do
        post :create, params: {post: {titulo: ''}}, session: login
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "com parametros validos valid params" do
      it "requisição para atualizar o post" do
        post = FactoryGirl.create(:post_nao_publicado)
        put :update, params: {id: post.to_param, post: valid_attributes}, session: login
        post.reload
      end

      it "Espera-se the requested post as @post" do
        post = FactoryGirl.create(:post_nao_publicado)
        put :update, params: {id: post.to_param, post: valid_attributes}, session: login
        expect(assigns(:post)).to eq(post)
      end

      it "redireciona para posts" do
        post = FactoryGirl.create(:post_nao_publicado)
        put :update, params: {id: post.to_param, post: valid_attributes}, session: login
        expect(response).to redirect_to(posts_path)
      end
    end

    context "com parametros invalidos" do
      it "Espera-se que tenha o objeto @post renderizado" do
        post = FactoryGirl.create(:post_nao_publicado)
        put :update, params: {id: post.id, post: valid_attributes}, session: login
        expect(assigns(:post)).to eq(post)
      end

      it "Renderiza novamente o template 'edit'" do
        post = FactoryGirl.create(:post_nao_publicado)
        put :update, params: {id: post.id, post: invalid_attributes}, session: login
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "Espera-se que seja excluido um post selecionado" do
      post = FactoryGirl.create(:post_nao_publicado)
      expect {
        delete :destroy, params: {id: post.id}, session: login
      }.to change(Post, :count).by(-1)
    end

    it "Esera-se que seja redirecioando para a listagem de posts" do
      post = FactoryGirl.create(:post_nao_publicado)
      delete :destroy, params: {id: post.id}, session: login
      expect(response).to redirect_to(posts_url)
    end
  end

end
