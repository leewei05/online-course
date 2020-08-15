FactoryBot.define do
    factory :course do
        id { 2 }
        name { "GCP 101" }
        price { 99.99 }
        on_shelf { true }
        currency { "USD" }
    end

    factory :user do
        user_id { 1 }
    end
end
