FactoryBot.define do
    factory :course do
        name { "GCP 101" }
        price { 10000 }
    end

    factory :user do
        user_id { 1 }
    end
end
