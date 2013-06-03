require "sinatra"
require "sinatra/reloader"
require "image_suckr"
require "movies"
require "stock_quote"
require "pry"

get "/" do
  erb :index
end

get "/moviesresults" do


begin
	if params[:movies] != nil &&params[:movies].to_s.length > 0
		
		
	
		@movie=params[:movies]
		@result=Movies.find_by_title(@movie)
		new=ImageSuckr::GoogleSuckr.new
		@movieimage=new.get_image_url({"q"=>@movie})

		if @result.title.nil?
			erb :movies
		else

		erb :moviesresults
		end	

	else
		erb :movies
	end

	
rescue
	erb :movies
end	
end
	# begin	

	# rescue
	# erb :movies	
	# end
	# rescue

	# end

	# begin
	
	# 	erb :moviessults
	# rescue
	# 	erb :movies
	
	# end

	# if @result.title.nil?
		# @result="it"

	# end


	# end	

	


get "/movies" do
	erb :movies
end


get "/images" do
  	erb :images
end


get "/imagesresults" do
	begin
	@image=params[:images]
	new=ImageSuckr::GoogleSuckr.new
	@theimage=new.get_image_url({"q"=>@image})
	@array=["apple","blue","fast","door","man","light","key","fit","car",
			"leaf","ear","penny","random","nsx","skyline","gtr","supra turbo"]
			
	@sample=@array.sample	
	erb :imagesresults
	rescue
	erb :images
	end
end 


get "/stocks" do
 	 erb :stocks
end

get "/stocksresults" do
	begin
	@stock=params[:stocks]
	@new=StockQuote::Stock.quote(@stock)
	@company_name=@new.company
	@value=@new.last
	
	erb :stocksresults
	rescue
	erb :stocks
	end
end




























# binding.pry