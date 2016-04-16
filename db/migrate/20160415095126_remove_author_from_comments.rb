class RemoveAuthorFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :commeter, :string
  end
end
