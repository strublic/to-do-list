class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :favorites, :class_name => "Favorite", :foreign_key => 'favorite_id'
end
