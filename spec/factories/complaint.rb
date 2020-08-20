FactoryBot.define do
  factory :complaint do
    title { 'title' }
    description { 'description' }
    company { 'company' }
    country { 'country' }
    state { 'state' }
    city { 'city' }
    latitude { 10 }
    longitude { 10 }
    suburb { 'suburb' }
  end
end
