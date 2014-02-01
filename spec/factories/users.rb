FactoryGirl.define do
  
  sequence :email do |n|
    "#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}@gmail.com"
  end
    
  factory :admin, :class=>"user" do
    first_name "Jimmy"
    email {FactoryGirl.generate :email}
    password "12345678"
    role "administrator"
  end
  
  factory :student, :class=>"user" do
    first_name "Mark"
    email {FactoryGirl.generate :email}
    password "12345678"
    role "student"
  end
  
  factory :teacher, :class=>"user" do
    first_name "Jim"
    email {FactoryGirl.generate :email}
    password "12345678"
    role "teacher"
  end
end
