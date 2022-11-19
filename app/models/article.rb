class Article < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  attr_reader :tag_list_options
  validates :description, length: { maximum: 200 }
  has_rich_text :body
  pg_search_scope :basic_search, against: [:title], associated_against: {
    rich_text_overview: [:body]
  }
  scope :draft, -> { where(status: "DRAFT") }
  scope :published, -> { where(published: true) }
  scope :published_today, -> { where(published_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  scope :published_this_week, -> { where(published_at: DateTime.now.beginning_of_week..DateTime.now.end_of_week) }
  scope :published_this_month, -> { where(published_at: DateTime.now.beginning_of_month..DateTime.now.end_of_month) }
  scope :scheduled, -> { where(scheduled: true) }
  scope :scheduled_today, -> { where(scheduled_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
  CATEGORIES = ["News Alert", "Blog Post"]

  def self.publish_scheduled_posts
    self.scheduled_today.update_all(published: true, published_at: DateTime.now, status: "PUBLISHED")
  end

  def tag_list_options=(options)
    self.tag_list = options.gsub("'","")
  end

  def publish
    self.update(published: true, published_at: DateTime.now, status: "PUBLISHED")
  end

  def unpublish
    self.update(published: false, published_at: nil, status: "DRAFT")
  end

  def published?
    self.published
  end

  def schedule(params={})
    self.update(scheduled: true, scheduled_at: params[:scheduled_at], status: 'SCHEDULED')
  end

  def remove_schedule
    self.update(scheduled: false, scheduled_at: nil, status: 'DRAFT')
  end

  def date
    if self.published?
      self.published_at
    else
      self.created_at
    end
  end

  def scheduled_for_publication?
    self.scheduled_at == true and self.published == false
  end

  def scheduled_and_published?
    self.scheduled_at == true and self.published == true
  end
end
