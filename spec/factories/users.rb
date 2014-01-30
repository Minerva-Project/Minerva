FactoryGirl.define do
  factory :admin, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    role 'admin'
  end
  
  factory :student, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    role 'student'
  end
  
  factory :teacher, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    role 'teacher'
  end
end
