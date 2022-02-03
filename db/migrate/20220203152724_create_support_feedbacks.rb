class CreateSupportFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :support_feedbacks do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
