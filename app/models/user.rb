class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :role, :type => String, :default => ""
  field :first_name, :type => String, :default => ""
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :role

  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  field :remember_created_at, :type => Time

  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
    
  has_and_belongs_to_many :courses
  
  scope :all_students, where(:role=>"student")
  
end
