class CreateChefs < ActiveRecord::Migration[8.1]
  def change
    create_table :chefs do |t|
      t.string :name, validate: true, presence: true, maximum: 25
      t.string :email, validate: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
      t.string :password_digest, validate: true, presence: true, length: { minimum: 6 }
      t.timestamps
    end
  end
end
