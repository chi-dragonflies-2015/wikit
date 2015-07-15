class AddStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :state, :string, :default => 'unpublished'
  end
end
