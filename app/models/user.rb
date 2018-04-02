class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :lists, dependent: :destroy
  # has_many :, :class_name => 'List', :foreign_key => 'favorite_list_id'
  has_many :tasks, dependent: :destroy
  belongs_to :lists, :class_name => "List", :inverse_of => :user
  belongs_to :favorite_lists, :class_name => "List", :inverse_of => :favorite_user

end
