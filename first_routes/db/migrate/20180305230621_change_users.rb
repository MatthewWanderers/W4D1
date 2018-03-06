class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.timestamps
    end

    add_index :users, [:username]

    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false, unique: true
      t.timestamps
    end

    add_index :artworks, [:title]
    add_index :artworks, [:artist_id, :title]

    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
      t.timestamps
    end

    add_index :artwork_shares, [:viewer_id]
    add_index :artwork_shares, [:artwork_id]
  end
end
