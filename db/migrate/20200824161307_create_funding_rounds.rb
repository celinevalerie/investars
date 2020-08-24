class CreateFundingRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :funding_rounds do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
