class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :created_at, :timestamps
    add_column :articles, :updated_at, :timestamps
  end
end
