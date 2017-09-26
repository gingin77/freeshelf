class AddBooksToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :book, :references
  end
end
