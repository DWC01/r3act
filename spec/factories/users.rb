FactoryGirl.define do
  factory :user do
  
  first_name                  "David"
  last_name                   "Christian"
  email                       "david@displayadtech.com"
  avatar                      ""
  position                    "Founder"
  title                       "CEO"
  password                    "123P@ssw0rd!"
  admin                       "true"
  company_id                  1
  end

end
