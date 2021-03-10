FactoryBot.define do
  factory :client do
    forename { Faker::Name.name }
    surname { Faker::Name.name }
    middle_name { Faker::Name.name }
    birthday { DateTime.now - 16.years }
    street { Faker::Address.full_address }
    number_home { rand(100) }
    number_appartment { rand(100) }
    phone { "+375299#{6.times.map { rand(9) }.join}" }
    password { 'test_password' }
  end
end
