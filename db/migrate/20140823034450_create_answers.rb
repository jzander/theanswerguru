class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string  "text"
      t.integer "rating"

      t.timestamps
    end
    add_reference :answers, :decision, index: true
  end
end
