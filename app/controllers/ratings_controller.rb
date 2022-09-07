class RatingsController < ApplicationController

    def create
        @movie = Movie.find(params[:movie_id])

        @rating = @movie.ratings.build(rating_params)
        if @rating.save
            print('nice')            
        end
    end

    private
    def rating_params
        params.permit(:rating, :movie_id)
    end
end
