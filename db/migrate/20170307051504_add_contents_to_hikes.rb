class AddContentsToHikes < ActiveRecord::Migration
  def change
    add_column :hikes, :content2, :text
    add_column :hikes, :content3, :text
    add_column :hikes, :description, :text
  end
end
