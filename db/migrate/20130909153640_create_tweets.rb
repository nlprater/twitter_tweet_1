class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitter_user 
      t.text :text
      t.timestamps
    end
  end
end