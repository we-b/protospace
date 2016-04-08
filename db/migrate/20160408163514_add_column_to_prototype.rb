class AddColumnToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :likes_count, :integer, default: 0
  end
end
