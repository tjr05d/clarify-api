class AddAuthColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_digest, :string, limit:225
    add_column :users, :access_token, :string, limit:225, index: true, unique: true
    add_column :users, :reset_digest, :string, limit:225
    add_column :users, :reset_sent_at, :datetime
  end
end
