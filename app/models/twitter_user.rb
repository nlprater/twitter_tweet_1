class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def clear_tweets!
    self.tweets.each {|tweet| tweet.destroy}
  end

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    p tweets
    tweets.each {|tweet| Tweet.create(:text => tweet.text,
      :twitter_user_id => self.id)}
  end

  def tweets_stale?
    if self.tweets == [] || (Time.now - self.tweets.first.created_at) > 900 
      return true
    else
      return false
    end
  end

end