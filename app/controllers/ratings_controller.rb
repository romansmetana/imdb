class RatingsController < ApplicationController
    skip_before_action :verify_authenticity_token , only: [:create]
    protect_from_forgery with: :null_session

    def create
        @movie = Movie.find(rating_params[:movie_id])
        if @user.ratings.find_by(movie_id: @movie.id)
            render json: {success: false} 
        else
            @rating = @movie.ratings.build(rating_params)
            render json: {success: @rating.save}
        end
    end
    private
    def rating_params
        params.permit(:rating, :movie_id, :user_id)
    end
end
