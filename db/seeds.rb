# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'geek@gmail.com',
  password: '123456',
)

Customer.create!(
  first_name: '山田',
  last_name: '太郎',
  first_name_kana: 'ヤマダ',
  last_name_kana: 'タロウ',
  postal_code: '1234567',
  address: '大阪市大阪府',
  telephone_number: '1234567',
  is_deleted: false,
  email: 'yamada@gmail.com',
  password: '123456',
  )

Genre.create!(
  name: "ケーキ"
)

Genre.create!(
  name: "焼き菓子"
)

Genre.create!(
  name: "プリン"
)

Genre.create!(
  name: "キャンディ"
)

Item.create!(
  [
    {
      genre_id: 1,
      name: "ショートケーキ(ホール)",
      introduction: "いちごたっぷりショートケーキ",
      price: 2200,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/strawberry_cake.png")),filename: 'strawberry_cake.png')
    },
    {
      genre_id: 3,
      name: "クリームプリン",
      introduction: "ホイップクリームが乗った自家製プリン",
      price: 350,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cream_pudding.png")),filename: 'cream_pudding.png')
    },
    {
      genre_id: 4,
      name: "スペースキャンディ",
      introduction: "SNS映え間違いなしのキャンディ",
      price: 550,
      is_active: 'false',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/space_candy.png")),filename: 'space_candy.png')
    },
    {
      genre_id: 2,
      name: "バタークッキー",
      introduction: "自家製バターを使用した濃厚クッキー",
      price: 550,
      is_active: 'false',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/butter_cookie.png")),filename: 'butter_cookie.png')
    },
    {
      genre_id: 2,
      name: "自家製バームクーヘン",
      introduction: "甘さをおさえた大人のバームクーヘン",
      price: 2000,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/baumkuchen.png")),filename: 'baumkuchen.png')
    },
    {
      genre_id: 3,
      name: "自家製プリン",
      introduction: "長野県産のたまごを使用した濃厚プリン",
      price: 300,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pudding.png")),filename: 'pudding.png')
    },
    {
      genre_id: 1,
      name: "フラワーケーキ(ホール)",
      introduction: "バラをイメージしたショコラケーキ",
      price: 3000,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/flower_cake.png")),filename: 'flower_cake.png')
    },
    {
      genre_id: 4,
      name: "フルーツキャンディ",
      introduction: "カットフルーツをそのまま閉じ込めた可愛いキャンディ",
      price: 500,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/fruit_candy.png")),filename: 'fruit_candy.png')
    },
    {
      genre_id: 1,
      name: "フルーツケーキ(ホール)",
      introduction: "フルーツたっぷりのケーキ",
      price: 3000,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/fruit_cake.png")),filename: 'fruit_cake.png')
    },
    {
      genre_id: 2,
      name: "マカロン",
      introduction: "見た目も可愛いポップなマカロン",
      price: 1000,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/macaroon.png")),filename: 'macaroon.png')
    },
    {
      genre_id: 1,
      name: "モンブラン",
      introduction: "人気No.1!濃厚モンブラン",
      price: 500,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/montblanc.png")),filename: 'montblanc.png')
    },
    {
      genre_id: 1,
      name: "季節のケーキ(ホール)",
      introduction: "期間限定：オレンジとマンゴーのケーキ",
      price: 500,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/season_cake.png")),filename: 'season_cake.png')
    },
    {
      genre_id: 1,
      name: "チーズケーキ",
      introduction: "濃厚チーズケーキ",
      price: 800,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cheese_cake.png")),filename: 'cheese_cake.png')
    },
    {
      genre_id: 1,
      name: "チョコレートケーキ(ホール)",
      introduction: "濃厚チョコレートケーキ",
      price: 1800,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/choco_cake.png")),filename: 'choco_cake.png')
    },
    {
      genre_id: 1,
      name: "スペースケーキ",
      introduction: "SNS映え間違いなしのケーキ",
      price: 1000,
      is_active: 'true',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/space_cake.png")),filename: 'space_cake.png')
    }
  ]
)


Address.create!(
  customer_id: 1,
  postal_code: "1234567",
  address: "神奈川県横浜市",
  name: "斎藤さん"
  )
