class User < ApplicationRecord
  has_many :foods, class_name: 'Food', foreign_key: 'user_id'
  has_many :recipes, dependent: :destroy, foreign_key: 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
end
