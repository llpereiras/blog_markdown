class HomeController < ApplicationController

  def inicio
    @posts = Post.publicados
  end

end
