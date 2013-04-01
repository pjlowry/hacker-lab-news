class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :source_url, :string
      t.column :headline, :string

      t.timestamps
    end
  end
end
