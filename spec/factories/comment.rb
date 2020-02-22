FactoryBot.define do
  factory :comment do
    name { '洋光台' }
    route { '根岸線' }
  end

  factory :comment1, class: Comment do
    name { '磯子' }
    route { '根岸線' }
  end

  factory :comment2, class: Comment do
    name { '七里ヶ浜' }
    route { '江ノ島電鉄' }
  end

  factory :comment3, class: Comment do
    name { '鎌倉高校前' }
    route { '江ノ島電鉄' }
  end

end
