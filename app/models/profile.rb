class Profile < ApplicationRecord
  has_rich_text :bio
  has_one_attached :avatar
  has_one_attached :vcard
  extend FriendlyId
  friendly_id :title, use: :slugged

  PRIORITY_COUNTRIES = ['Anguilla', 'Antigua and Barbuda', 'Bahamas', 'Barbados',
      'Belize', 'Cayman Islands', 'Dominica', 'Grenada','Guyana',
      'Jamaica', 'Saint Kitts and Nevis', 'Saint Lucia',
      'Saint Vincent and the Grenadines', 'Trinidad and Tobago',
      'Turks and Caicos Islands']

  def self.possible_practice_areas
    options = Service.all.pluck(:title)
  end


end
