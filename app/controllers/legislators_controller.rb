class LegislatorsController < ApplicationController

before_action :authenticate

def show

	search_params = params[:id]
	results = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?bioguide_id="+search_params+"&apikey=7ad1d136628443878ceb8655871a8799")
  	@results = results.to_hash["results"]

###---Iterate through Sunlight Congress API to pull crp_id.  Put 'member["crp_id"]' into Open Secrets URL to pull three Open Secret APIs.   
  	
  	@results.each do |member|
 
##--Contributions by Orginization--##

  		open_secrets_org = HTTParty.get("http://www.opensecrets.org/api/?method=candContrib&cid="+member["crp_id"]+"&cycle=2014&apikey=63d23c972e6f7113b53b00bb1e72ad39")
  		
  		@open_secrets_org = open_secrets_org["response"]["contributors"]["contributor"]

##--Political Summary--##
  		
  		open_secrets_sum = HTTParty.get("http://www.opensecrets.org/api/?method=candSummary&cid="+member["crp_id"]+"&cycle=2014&apikey=63d23c972e6f7113b53b00bb1e72ad39")
  		
  		@open_secrets_sum = open_secrets_sum.to_hash["response"]

##--Contributions by Industry--##

  		open_secrets_ind = HTTParty.get("http://www.opensecrets.org/api/?method=candIndustry&cid="+member["crp_id"]+"&cycle=2014&apikey=63d23c972e6f7113b53b00bb1e72ad39")
  		
  		@open_secrets_ind = open_secrets_ind.to_hash["response"]["industries"]["industry"]

  	end

##--Convert number to Currency format--##

    def number_to_currency(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
    end


end

end