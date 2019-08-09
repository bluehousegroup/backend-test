class AddSortOrderToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sort_order, :integer
  end
end
