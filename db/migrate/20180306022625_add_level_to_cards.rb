class AddLevelToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :level, :integer
  end
end
