FactoryBot.define do
  factory :station do
    name { '洋光台' }
    route { '根岸線' }
  end

  factory :station1, class: Station do
    name { '磯子' }
    route { '根岸線' }
  end

  factory :station2, class: Station do
    name { '七里ヶ浜' }
    route { '江ノ島電鉄' }
  end

  factory :station3, class: Station do
    name { '鎌倉高校前' }
    route { '江ノ島電鉄' }
  end

end
