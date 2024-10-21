class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :text, presence: true, length: { minimum: 5 }
end
