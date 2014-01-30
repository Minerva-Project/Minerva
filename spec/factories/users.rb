FactoryGirl.define do
  factory :admin, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    status 'admin'
  end
  
  factory :student, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    status 'student'
  end
  
  factory :teacher, :class=>'user' do
    email 'londerson@gmail.com'
    password '12345678'
    status 'teacher'
  end
end
