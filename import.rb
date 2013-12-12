require 'json'
require 'riak'

file = open('data/ErlangInfo.json')
json = file.read

tweets = JSON.parse(json)

client = Riak::Client.new(:protocol => "pbc", :pb_port => 10017)

tweets_bucket = client.bucket('tweets')

tweets.each do |tweet|
	tweet_obj = tweets_bucket.new(tweet["id_str"])
	tweet_obj.data = tweet

	tweet_obj.store()
end