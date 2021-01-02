class Article < ApplicationRecord
 belongs_to :user
 has_rich_text :text
 validates :title, :text, presence: true
 acts_as_taggable
end
