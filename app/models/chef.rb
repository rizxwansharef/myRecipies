class Chef < ApplicationRecord
    has_many :recipes, dependent: :destroy
    validates :name, presence: true 
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    has_many :comments, dependent: :destroy
end