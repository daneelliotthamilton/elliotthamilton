class Service < ApplicationRecord
  belongs_to :practice_area
  has_rich_text :content
  extend FriendlyId
  friendly_id :title, use: :slugged
  CATEGORIES = ["Banking & Finance", "Corporate & Commercial", "Administrative & Constitutional Law", "Dispute Resolution", "Real Estate", "Intellectual Property", "Personal Injury & Insurance"]
end
