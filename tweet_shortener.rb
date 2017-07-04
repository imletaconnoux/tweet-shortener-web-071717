def dictionary
  {"hello" => "hi", "to" => "2", "two" => "2", "too" => "2", "for" => "4", "four" => "4", "be" => "b", "you" => "u", "at" => "@", "and" => "&"}
end

def word_substituter(tweet)
  tweet_array = tweet.split
  s_keys = dictionary.keys
  short_array = tweet_array.collect {|word| s_keys.include?(word.downcase) ? dictionary[word.downcase] : word}
  short_tweet = short_array.join(" ")
  return short_tweet
end

def bulk_tweet_shortener(tweets)
  tweets.collect do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  elsif tweet.length <= 140
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  sub_tweet = word_substituter(tweet)
  if sub_tweet.length > 140
    truncate_tweet = sub_tweet[0..136]
    truncate_tweet << "..."
  elsif sub_tweet.length <= 140
    sub_tweet
  end
end
