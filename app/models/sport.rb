class Sport

	attr_accessor :name, :players, :description, :court, :created_in, :id

	def initialize(hash)
		@name = hash["name"]
		@players = hash["players"]
		@description = hash["description"]
		@court = hash["court"]
		@created_in = hash["created_in"]
		@id = hash["id"]

	end

	def full_sport
		return "The sport of #{@name} has #{@players} players, and can easily be described as #{@description},   played on #{court}.  It was created in #{created_in} "
	end

	def self.find(id)
		return Sport.new(Unirest.get("#{ENV["SPORT_API_ROOT"]}/sports/#{id}.json").body)

	end

	def self.all
		@sports = []
		  raw_sports = Unirest.get("#{ENV["SPORT_API_ROOT"]}/sports.json").body
	  	  raw_sports.each do |sport_hash|
	  	    @sports << Sport.new(sport_hash)
	  	end

		return @sports
	end

	def self.create

	end 

	# def destroy
	# 	Unirest.destroy("http://localhost:3000/sports/#{@id]}.json", headers:{ "Accept" => "application/json"})

	# end
end



# def name
# 	return @first_name
# end

# def name=(name)
# 	@name = name
# end

### ^^^^ what attr_accessor allows us to do. The reader, then writer.
