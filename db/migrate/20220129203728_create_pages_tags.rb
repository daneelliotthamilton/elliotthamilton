class CreatePagesTags < ActiveRecord::Migration[7.0]
  def change
    create_table :pages_tags do |t|
      t.string :property
      t.text :content
      t.string :property_type
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
