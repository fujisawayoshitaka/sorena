FactoryBot.define do
  factory :neta do
    image { 'zwz_AAQj.png' }
    content { 'neta' }
  end

  factory :neta1, class: Neta do
    image { '' }
    content { 'neta1' }
  end

  factory :neta2, class: Neta do
    image { '' }
    content { 'neta2' }
  end

  factory :neta3, class: Neta do
    image { '' }
    content { 'neta3' }
  end

end
