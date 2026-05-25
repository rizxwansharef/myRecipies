class Comment < ApplicationRecord
    belongs_to :recipe
    belongs_to :chef 
    validates :chef_id, presence: true
    validates :content, presence: true
    default_scope { order(created_at: :desc) }
end