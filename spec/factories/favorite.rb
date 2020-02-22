FactoryBot.define do
  factory :favorite do
    user { '洋光台' }
    neta { '根岸線' }
  end

  factory :favorite1, class: Favorite do
    user { '磯子' }
    neta { '根岸線' }
  end

  factory :favorite2, class: Favorite do
    user { '七里ヶ浜' }
    neta { '江ノ島電鉄' }
  end

  factory :favorite3, class: Favorite do
    user { '鎌倉高校前' }
    neta { '江ノ島電鉄' }
  end

end
