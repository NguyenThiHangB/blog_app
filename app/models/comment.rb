class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :content, presence: true
  validates :user_id, presence: true
  validates :entry_id, presence: true
end
