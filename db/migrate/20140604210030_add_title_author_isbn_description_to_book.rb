class AddTitleAuthorIsbnDescriptionToBook < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :isbn, :string
    add_column :books, :description, :string
  end
end
