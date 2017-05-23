require 'rails_helper'

RSpec.describe "Login", :type => :feature do

    let(:ir_para_home) { 
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user, :run_callbacks => false)
        visit root_path
    }

    describe "the signin process", :type => :feature do

      it "Espera-se que esteja logado então tenha um botão sair" do
        ir_para_home
        expect(page).to have_content 'Sair'
      end

      it "Espera-se que possa clicar em um item do menu com nome Posts" do
        ir_para_home
        find_link('Posts', :visible => :all).visible?
        click_link('Posts')
        expect(page).to have_current_path(posts_path)
        expect(page).to have_content 'Novo Post'
        click_link('Novo Post')
        expect(page).to have_content 'Texto em Markdown'
      end

      it "Espera-se que tenha campos titulo e texto geral" do
        ir_para_home
        click_link('Posts')
        click_link('Novo Post')

        expect(page).to have_content 'Texto em Markdown'

        fill_in('post[titulo]', with: Faker::Name.name)
        fill_in('post[texto_md]', with: "# H1\r\n## H2\r\n### H3\r\n#### H4\r\n##### H5\r\n###### H6\r\n\r\nAlternatively, for H1 and H2, an underline-ish style:\r\n\r\nAlt-H1\r\n======\r\n\r\nAlt-H2\r\n------")

        click_button('Salvar')

        expect(page).to have_css('body > div > div.alert.alert-success')
        expect(page).to have_content 'Post foi criado com sucesso.'
        
      end

    end
end