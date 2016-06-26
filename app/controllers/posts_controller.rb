class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # インスタンス変数にPostの空のインスタンスを生成
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
    @post = Post.find(params[:id])
  end

  def update
    # URLからidを収録して今ある更新前のデータを取得してインスタンス変数にセット
    @post = Post.find(params[:id])
    # インスタンス変数をupdate（ストロングパラメータから収録した値が引数）
    @post.update(post_params)
    # showにリダイレクト
    # redirect_to "/posts/#{@post.id}"
    # redirect_to post_path(@post)
    redirect_to @post
  end

  def destroy
  end

  private

  # ストロングパラメータを定義
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
