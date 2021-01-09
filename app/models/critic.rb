class Critic < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true

  validates :title, :body, presence: true
  validates :title, length: { maximum: 40 }
end
