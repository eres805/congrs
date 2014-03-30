class LegislatorsController < ApplicationController


def show

	search_params = params[:id]
	results = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?bioguide_id="+search_params+"&apikey=7ad1d136628443878ceb8655871a8799")
  	@results = results.to_hash["results"]
    
end

end