class RemoveRatingsFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :ratings
  end
end
