class CreateComicBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :comic_books do |t|
      t.string :title
      t.string :volume
      t.string :publisher

      t.timestamps
    end
  end
end
