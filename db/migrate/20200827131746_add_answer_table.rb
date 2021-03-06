class AddAnswerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question, index:true, foreign_key: true
      t.references :investment, index:true, foreign_key: true
      t.timestamps
    end
  end
end
