class AddPracticeAreasToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :practice_area_id, :integer, index: true
  end
end
