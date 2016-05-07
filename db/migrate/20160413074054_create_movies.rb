class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :language
      t.date :date_watched
      t.string :poster_url

      t.timestamps null: false
    end
  end
end
