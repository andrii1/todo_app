class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :task_users
  has_many :tasks, through: :task_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
