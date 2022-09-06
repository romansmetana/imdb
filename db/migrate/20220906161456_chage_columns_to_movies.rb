class ChageColumnsToMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :title, :string, :default => '', :null => false
    change_column :movies, :description, :text, :default => '', :null => false
  end
end
