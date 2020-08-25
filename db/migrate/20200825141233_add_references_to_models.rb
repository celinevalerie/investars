class AddReferencesToModels < ActiveRecord::Migration[6.0]
  def change
    add_reference :investments, :user, index: true
    add_foreign_key :investments, :users
    add_reference :investments, :funding_round, index: true
    add_foreign_key :investments, :funding_rounds
    add_reference :funding_rounds, :user, index: true
    add_foreign_key :funding_rounds, :users
  end
end
