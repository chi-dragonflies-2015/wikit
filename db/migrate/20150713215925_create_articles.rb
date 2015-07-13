class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :contents
      t.references :author

      t.timestamps
    end
  end
end
