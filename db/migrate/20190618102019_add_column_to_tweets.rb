class AddColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :prefecture, :integer, null: false, default: ""
  end
end
