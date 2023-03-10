FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample }
    release_date { "2023-03-10 09:29:04" }
    developer { Faker::Company.name }
    system_requirement
  end
end
