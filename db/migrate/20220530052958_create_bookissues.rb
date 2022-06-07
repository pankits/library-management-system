class CreateBookissues < ActiveRecord::Migration[6.0]
  def change
    create_table :bookissues do |t|
      t.date :issue_date
      t.references :rentel, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
