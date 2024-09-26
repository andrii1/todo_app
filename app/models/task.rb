class Task < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :due_date, presence: true
end
