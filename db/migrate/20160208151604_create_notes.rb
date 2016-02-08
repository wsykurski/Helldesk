class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :message
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :issue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
