class CorrectAuthorTypeInBooks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :books, :auhtor, :author
  end
end
