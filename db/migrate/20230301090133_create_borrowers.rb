class CreateBorrowers < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowers do |t|
      t.string :borrower
      t.string :body
      t.references :comic_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
