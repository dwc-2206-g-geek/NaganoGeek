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
   genre_id: 1,
   name: "ショートケーキ",
   introduction: "いちごたっぷりショートケーキ",
   price: 450,
   is_active: true
)