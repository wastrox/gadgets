FactoryGirl.define do
  factory :user do
    sequence :email do |n| "person#{n}@example.com" end
    password '123'
    password_confirmation "123"
	
	factory :another_user do
		sequence :email do |n| "another_person#{n}@example.com" end
		password '123'
		password_confirmation "123"
	end
  end
end