class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :telephone, :sex, :web_site, :status,
                  :street_address, :city, :state, :country, :observation, :first_name, :last_name

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :profile
end
