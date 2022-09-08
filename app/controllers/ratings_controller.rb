class RatingsController < ApplicationController
    skip_before_action :verify_authenticity_token 
    protect_from_forgery with: :null_session

    def create
        @movie = Movie.find(rating_params[:movie_id])
        @rating = @movie.ratings.build(rating_params)
        render json: {success: @rating.save}
    end
    private
    def rating_params
        params.permit(:rating, :movie_id)
    end
end
