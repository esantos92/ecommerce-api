FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic-#{n}" }
    operational_system { Faker::Computer.os }
    storage { "500gb" }
    processor { "AMD Ryzen 5 3300x" }
    memory { "16gb" }
    video_board { "GTX 1660 super" }
  end
end
