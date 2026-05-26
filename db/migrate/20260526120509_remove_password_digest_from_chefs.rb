class RemovePasswordDigestFromChefs < ActiveRecord::Migration[8.1]
  def change
    remove_column :chefs, :password_digest, :string
  end
end
