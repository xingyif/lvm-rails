class CreateTutorComments < ActiveRecord::Migration[5.0]
  def change
    create_table :tutor_comments do |t|
      t.belongs_to :tutor

      t.text :content, null: false

      t.timestamps
    end
  end
end
