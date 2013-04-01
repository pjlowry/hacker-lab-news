class AddPointsColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :points, :integer
  end
end
