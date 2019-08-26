class Article < ApplicationRecord
  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 10 }
end
