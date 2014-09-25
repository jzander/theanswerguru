class CreateCriteriaAnswers < ActiveRecord::Migration
  def change
    create_table :criteria_answers do |t|
      t.references :answer, index: true
      t.references :criterion, index: true
      t.integer :rating

      t.timestamps
    end
  end
end
