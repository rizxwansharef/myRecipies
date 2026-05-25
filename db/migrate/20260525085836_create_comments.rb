class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text:content 
      t.integer:chef_id
      t.integer:recipe_id
      t.timestamps
    end
  end
end

