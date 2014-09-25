class RemoveRatingFromTableAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :rating, :integer
  end
end
