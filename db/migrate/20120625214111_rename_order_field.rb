class RenameOrderField < ActiveRecord::Migration
  def change
    rename_column :categories, :order, :rank
  end
end