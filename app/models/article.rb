class Article < ApplicationRecord
 has_rich_text :text
 validates :title, :text, presence: true
end
