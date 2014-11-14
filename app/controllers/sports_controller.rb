class SportsController < ApplicationController
	
	def show
	  @sport = Sport.find(params[:id])

	  # @sport = Sport.new(Unirest.get("http://localhost:3000/sports/#{params[:id]}.json").body)
	  # ^^^ first way before we created a "self" method in the model
	  # puts "sportssssssss"
	end

	def index
	  @sports = Sport.all


	  # @sports = []
	  # raw_sports = Unirest.get(("http://localhost:3000/sports.json")).body
	  # raw_sports.each do |sport_hash|
	  # 	@sports << Sport.new(sport_hash)
	  # end

	  # ^^ This is what was pulled to the model, and put onto the POGO (since 
	  # there is not an ".all" method associated with it 
	  # as it was not generated in Rails)

	  # puts @sports
	  # puts "sports list"
	end

	def create
	  # @sport = Sport.create
      @sport = Unirest.post("http://localhost:3000/sports.json",
        headers:{ "Accept" => "application/json" },
        	parameters: { :sport => 
                         {
                           :name => params[:name],
                           :players => params[:players],
                           :description => params[:description],
                           :court => params[:court],
                           :created_in => params[:created_in]
                          }
                         }
              ).body

      redirect_to sport_path(@sport["id"])
    end

    def new

    end

    def update
    	@sport = Unirest.patch("http://localhost:3000/sports/#{params[:id]}.json",
        headers:{ "Accept" => "application/json" },
        	parameters: { :sport => 
                         {
                           :name => params[:name],
                           :players => params[:players],
                           :description => params[:description],
                           :court => params[:court],
                           :created_in => params[:created_in]
                          }
                         }
              ).body
      	puts @sport
      	puts "test"

      	redirect_to sport_path(@sport["id"])


    end

    def edit
    	@sport = Unirest.get("http://localhost:3000/sports/#{params[:id]}.json", 
                  headers:{ "Accept" => "application/json" }).body
    	puts @sport
    end

    def destroy
      @sport = Sport.find(params[:id])
      @sport.destroy

      # Unirest.delete("http://localhost:3000/sports/#{params[:id]}.json",
      # headers:{ "Accept" => "application/json"})

      redirect_to sports_path
  end


end
