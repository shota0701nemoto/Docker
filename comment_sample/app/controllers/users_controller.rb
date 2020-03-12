class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show #showアクション。レコードの内容を表示する。
    @user = User.find(params[:id])
  end
end
