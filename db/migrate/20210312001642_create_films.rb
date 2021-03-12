class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.text :synopsis
      t.references :director, null: false, foreign_key: true
      t.integer :rating, limit: 5

      t.timestamps
    end
  end
end
