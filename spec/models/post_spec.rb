require 'rails_helper'

RSpec.describe Post, type: :model do
  
  describe "validações" do
    
    subject(:post){ FactoryGirl.build(:post_nao_publicado) }
    
    it "titulo deve ser obrigatório" do
      post.titulo = nil
      expect(post.save).to be false
    end

  end
  
end