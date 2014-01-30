class User < ActiveRecord::Base
  rolify
  attr_accessible :email, :password, :password_confirmation, :telephone, :sex, :web_site, :status,
                  :street_address, :city, :state, :country, :observation, :first_name, :last_name,
                  :remember_me

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_and_belongs_to_many :courses
end
