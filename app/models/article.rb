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
  CATEGORIES = ["News Alert", "Blog Post"]

  def tag_list_options=(options)
    self.tag_list = options.gsub("'","")
  end

  def publish
    self.published, self.published_at = true, DateTime.now
    self.save
  end

  def unpublish
    self.published, self.published_at = false, nil
    self.save
  end

  def published?
    self.published
  end

  def schedule(params={})
    self.update(scheduled: true, scheduled_time: params[:scheduled_at], status: 'SCHEDULED')

  end

  def remove_schedule
    self.update(scheduled: false, scheduled_time: nil, status: 'DRAFT')
  end

  def date
    if self.published?
      self.published_at
    else
      self.created_at
    end
  end
end
