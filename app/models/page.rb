class Page < ApplicationRecord
  has_many :tags, class_name: "Pages::Tag", dependent: :destroy
  has_rich_text :content
  validates_uniqueness_of :url
  accepts_nested_attributes_for :tags, reject_if: ->(attributes){ attributes['content'].blank? }, allow_destroy: true

end
