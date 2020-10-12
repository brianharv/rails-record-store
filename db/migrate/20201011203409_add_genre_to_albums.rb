class AddGenreToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column(:albums, :genre, :string) #add column "genre" to table "albums" and genre is a "string."
  end
end
