class RenameContentToCommentToBookmark2 < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookmarks, :content, :comment
  end
end
