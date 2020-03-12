class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create] #showアクション、createアクションを実行する前にログインしているかチェックする。自動でログイン画面に移動する。
  def index #このアクションでviewに変数を渡している。
    @posts = Post.all #インスタンス変数postの投稿を全て表示する。
    @post = Post.new #form_forのsubmitで渡されたデータで投稿作る。作ったものを@postに代入。
  end

  def show #アクション名
    @post = Post.find(params[:id]) #インスタンス変数post（indexアクションで渡されたデータ）にfindメソッドを使って持ってきた値（ユーザーid）を代入。Postモデル。
    @comments = @post.comments #インスタンス変数commentsに、コメントを紐付けたインスタンス変数post（一行上の値）を代入。コメント一覧で表示。
    @comment = Comment.new #form_forで渡されたデータでコメント作る。データベースに保存される。
  end

  def create #アクション名。newと同時にsaveを実行する。
    @post = Post.new(post_params) #form_forで渡されたデータで投稿作る。そして代入。postモデルかどうか、カラムはcontentかどうかをdef post_paramsでチェック。
    @post.user_id = current_user.id #投稿に紐づけられたユーザーIDが現在ログインしているユーザーのidになるようにする。
    if @post.save #データベースに保存する。
      redirect_back(fallback_location: root_path) #ブラウザの表示をrootpathのページに移動させる。
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private #セキュリティを高めるため。
  def post_params
    params.require(:post).permit(:content)
  end
end

#インスタンス変数（@から始まるもの）を経由することでcontrollerからViewへ変数を渡すことができる。
