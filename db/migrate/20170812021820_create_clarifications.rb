class CreateClarifications < ActiveRecord::Migration[5.1]
  def change
    create_table :clarifications do |t|
      t.string :url
      t.text :selection
      t.integer :state

      t.timestamps
    end
  end
end
