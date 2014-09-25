class Criteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.string  "text"
      t.integer "importance"

      t.timestamps
    end
    add_reference :criteria, :decision, index: true
  end
end
