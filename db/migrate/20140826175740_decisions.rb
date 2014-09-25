class Decisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string  "text"
      t.string  "decision"
    end
    add_reference :decisions, :user, index: true
  end
end
