class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :created_at
    remove_column :articles, :updated_at
  end
end
