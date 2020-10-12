class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table(:albums) do |t|
      t.column(:name, :string) #varchar maps to string
      t.column(:year, :integer) 

      t.timestamps() #generates columns called created_at and updated_at
    end
  end
end
