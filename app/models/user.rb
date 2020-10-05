class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :first_name,format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid"}
    validates :family_name,format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid"}
    validates :first_name_kana, format:{ with: /\A[ァ-ン]/, message: "is invalid"} 
    validates :family_name_kana, format:{ with: /\A[ァ-ン]/, message: "is invalid"} 
    validates :email, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is invalid"}
    validates :password, format:{ with:/\A[a-z\d]{6,}\z/i, message:"is invalid"}
    validates :birthday
  end
  has_many :items
end
