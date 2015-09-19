class AddAuthorToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :author, :boolean, default: false
  end
end
