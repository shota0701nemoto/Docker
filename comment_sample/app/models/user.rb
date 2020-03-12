class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy  #userが複数の投稿をできる。dependentオプションという、モデルが削除されるときの関連付けされたモデルに対しる挙動を定義するもの。
  has_many :comments #userが複数のコメントをできる。
end

#
