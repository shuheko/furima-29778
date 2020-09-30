class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :first_name,format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :family_name,format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :first_name_kana, format:{ with: /\A[ァ-ン]/, message: "全角カタカナで入力してください"} 
    validates :family_name_kana, format:{ with: /\A[ァ-ン]/, message: "全角カタカナで入力してください"} 
    #validates :email, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "正しいメールアドレスを入力してください"}
    #validates :password, format:{ with:/\A[a-z\d]{6,}/i}
    validates :birthday
  end

end
