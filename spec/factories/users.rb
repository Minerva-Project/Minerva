FactoryGirl.define do
  factory :admin, :class=>"user" do
    first_name "Jimmy"
    email "jimmy@gmail.com"
    password "12345678"
    role "administrator"
  end
  
  factory :student, :class=>"user" do
    first_name "Mark"
    email "mark@gmail.com"
    password "12345678"
    role "student"
  end
  
  factory :teacher, :class=>"user" do
    first_name "Jim"
    email "jim@gmail.com"
    password "12345678"
    role "teacher"
  end
end
