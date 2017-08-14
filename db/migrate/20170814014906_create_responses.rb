class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :response_text
      t.integer :likes
      t.integer :dislikes
      t.belongs_to :clarification, foreign_key: true

      t.timestamps
    end
  end
end
