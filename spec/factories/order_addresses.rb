FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'東京都'}
    address {'1-1'}
    building_name {'東京ハイツ'}
    phone_number {'09012345678'}
    user_id {1}
    item_id {1}
    token {"tok_abcdefghijk00000000000000000"}

    association :user, :item
  end
end
