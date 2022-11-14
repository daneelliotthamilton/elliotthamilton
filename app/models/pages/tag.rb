class Pages::Tag < ApplicationRecord
  belongs_to :page
  PROPERTIES = %w(name description twitter:card twitter:title twitter:description twitter:creator twitter:site twitter:image image
   og:title og:image og:type og:url og:description og:site_name author fb:app_id fb:admins article:published_time
   keywords)
  TYPES = %w(itemprop name property)
end
