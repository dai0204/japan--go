class AddColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :prefecture_id, :integer
  end
end
