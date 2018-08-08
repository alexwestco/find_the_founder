class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	
  end

  def success
  	@username = session[:twitter_username]
  end


  def fetch
  	begin
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV.fetch('FIND_THE_FOUNDER_CONSUMER_KEY')
		  config.consumer_secret     = ENV.fetch('FIND_THE_FOUNDER_CONSUMER_SECRET')
		  config.access_token        = session[:token]
	  	  config.access_token_secret = session[:secret]
	  	end
		
		# This will raise a 500 error

	  	followers = client.followers("gem")
	  	#puts followers[0]
		followers.each_slice(100) do |follower|
			puts follower
		end
	  	# No error was raised, create the list
	  	if @list.save
	      	redirect_to "/"
	    else
	      	render 'new'
	    end
	rescue Twitter::Error::NotFound => e
	    # if list is not found
	    redirect_to '/'
	end

  end

end
