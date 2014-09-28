FactoryGirl.define do
  factory :gadget do
  	sequence :title do |n| "test gadget #{n}" end
  	user @user
  end
end
