FactoryGirl.define do
  factory :admin, :class=>'user' do
    first_name 'Marko'
    email 'marko@gmail.com'
    password '12345678'
    role 'admin'
  end
  
  factory :student, :class=>'user' do
    first_name 'Jim'
    email 'jim@gmail.com'
    password '12345678'
    role 'student'
  end
  
  factory :teacher, :class=>'user' do
    first_name 'Samura'
    email 'samura@gmail.com'
    password '12345678'
    role 'teacher'
  end
end
