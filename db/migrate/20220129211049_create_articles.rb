class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.string :category
      t.string :slug, unique: true, index: true
      t.text :description
      t.boolean :published, default: false
      t.datetime :published_at
      t.boolean :scheduled, default: false
      t.datetime :scheduled_at
      t.string :status, default: "DRAFT"

      t.timestamps
    end
  end
end
