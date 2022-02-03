class RemoveVcardFromProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :vcard
  end
end
