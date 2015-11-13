FactoryGirl.define do
  factory :user do
  	name "username"
  	password "password"
  	email "sample@example.com"

  	factory :admin_user do
		admin true
	end
  end
end