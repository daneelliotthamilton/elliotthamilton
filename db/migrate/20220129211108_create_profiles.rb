class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :title
      t.text :biogragraphy
      t.text :bar_admissions
      t.text :education
      t.text :expertise
      t.string :vcard
      t.string :email

      t.timestamps
    end
  end
end
