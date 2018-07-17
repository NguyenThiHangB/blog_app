class Entry < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :index_entry, ->{select("id, title, content, user_id, created_at").order created_at: :desc}
  pg_search_scope :search_by_entry, against: [:title],
    using: {
      tsearch: {
        prefix: true
      }
    }

  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: Settings.entry.title.length}
  validates :content, presence: true
end
