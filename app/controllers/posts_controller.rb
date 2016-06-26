class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    # インスタンス変数にPostの空のインスタンスを
    @post = Post.new
  end

  def create
    # インスタンス変数に空枠（ストロングパラメータから取得した値が引数）を渡す
    @post = Post.new(post_params)
    # 保存
    @post.save
    # showにリダイレクト
    # redirect_to "/posts/#{@post.id}"
    redirect_to @post
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # ストロングパラメータを定義
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
