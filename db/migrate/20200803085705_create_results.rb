class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.text :date
      t.text :home_team
      t.text :away_team
      t.integer :home_score
      t.integer :away_score
      t.text :tournament
      t.text :city
      t.text :country
      t.text :neutral

      t.timestamps
    end
  end


end
