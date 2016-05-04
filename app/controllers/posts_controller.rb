class PostsController < ApplicationController
  #indexとshow以外のアクションの際は認証を必須とし、パスワードを設ける(知らない人は操作出来ないようにする)
  http_basic_authenticate_with name: "user", password: "secret", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post

    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path
  end


private

def post_params
  params.require(:post).permit(:title, :text)
end

end
