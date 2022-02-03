class CreatePracticeAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_areas do |t|
      t.string :title
      t.string :slug, unique: true, index: true

      t.timestamps
    end
  end
end
