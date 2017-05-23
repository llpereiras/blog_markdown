class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
        begin
          if @post.save
            MarkdownToHtmlWorker.perform_async(@post.id)
            format.html do
              flash[:success] = 'Post foi criado com sucesso.'
              redirect_to posts_path
            end
            format.json { render :show, status: :created, location: @post }
          else
            format.html do 
              flash[:error] = 'Problemas ao salvar seu Post.'
              render :new   
            end
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        rescue Exception => e
            format.html do 
              flash[:error] = 'Problemas ao salvar seu Post.' + e.message
              render :new   
            end
            format.json { render json: e.message, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
        begin
          if @post.update(post_params)
            MarkdownToHtmlWorker.perform_async(@post.id)
            format.html do
              flash[:success] = 'Post foi atualizado com sucesso.'
              redirect_to posts_path 
            end
            format.json { render :show, status: :ok, location: @post }
          else
            format.html { render :edit }
             format.html do 
              flash[:error] = 'Problemas ao salvar seu Post.'
              render :edit
            end
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        rescue Exception => e
            format.html do 
              flash[:error] = 'Problemas ao salvar seu Post.' + e.message
              render :edit   
            end
            format.json { render json: e.message, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html do 
        flash[:success] = 'Post foi excluído com sucesso.'
        redirect_to posts_url
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:titulo, :texto_md, :texto_html)
    end
end
