class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  has_many :friends
  has_many :users, source: :friend, through: :friends
end
