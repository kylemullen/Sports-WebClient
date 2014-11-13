class SportsController < ApplicationController
	
	def show
	  @sport = Unirest.get(("http://localhost:3000/sports/#{params[:id]}.json")).body
	  puts "sportssssssss"
	end

	def index
	  @sports = Unirest.get(("http://localhost:3000/sports.json")).body
	  puts @sports
	  puts "sports list"
	end

	def create
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
      puts @sport
      puts "test"

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

end
