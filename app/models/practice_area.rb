class PracticeArea < ApplicationRecord
  has_many :services
  has_rich_text :description
  extend FriendlyId
  friendly_id :title, use: :slugged
end
