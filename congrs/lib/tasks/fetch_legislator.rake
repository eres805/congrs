namespace :legislators do

	desc "fetch legislators"
	
	task :fetch => :environment do

		
		results = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?per_page=all&apikey=7ad1d136628443878ceb8655871a8799")
	  	@results = results.to_hash["results"]

	  	# puts @results[0]
	  	@results.each do |legislator_data|
	  		Legislator.create({
	  			first_name: legislator_data["first_name"],
	  			last_name: legislator_data["last_name"],
	  			party: legislator_data["party"],
	  			state: legislator_data["state"],
	  			bioguide_id: legislator_data["bioguide_id"]
	  			})

	  	end
		
	end




end

