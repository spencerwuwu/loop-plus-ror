# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation)

Role.create([
  {id: 1, name: 'admin'}
])
Role.create([
  {id: 2, name: 'manager'}
])
Role.create([
  {id: 3, name: 'staff'}
])
Role.create([
  {id: 4, name: 'member'}
])
Role.create([
  {id: 5, name: 'pending'}
])
Role.create([
  {id: 6, name: 'un_finish'}
])

User.create([
  {email: 'gg@gmail.com',
   name: '歐巴馬英九孔鏘',
   personal_id: 'A12345678',
   gender: 'male',
   password: 'ggininder',
   confirmed_at: Time.now
}
])

user = User.find(1)
user.add_role "admin"
user.save

def dummy_text
  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem."
end

Article.create([
  title: "Spencer is handsome",
  subtitle: "so handsome",
  content: dummy_text,
  created_at: Time.now
])
Article.create([
  title: "Spencer is so handsome",
  subtitle: "very handsome",
  content: dummy_text,
  created_at: Time.now
])
Article.create([
  title: "Spencer is so handsome",
  subtitle: "extremely handsome",
  content: dummy_text,
  created_at: Time.now
])

Product.create([
  title: "100元優惠專案",
  price: "100",
  description: "100!~~~~",
])


Product.create([
  title: "200元優惠專案",
  price: "200",
  description: "100!~~~~100!~~~~200!!!",
])

PaymentConfig.create([
  hash_key: "GwoLzUJfHFBmNFuQWRcGPqivCoZkk8t7",
  hash_iv: "OEDYD3oSkjxrNil2",
  merchant_id: "MS32532314",
])


PaymentType.create([
  name: "超商條碼繳費",
  argu_name: "BARCODE",
  barcode: "1",
  cvs: "0",
  atm: "0",
  credit: "0",
  fee: "20",
  addon_fee: "20",
  description: "20元，付款日+10日",
])

PaymentType.create([
  name: "超商代碼繳費",
  argu_name: "CVS",
  barcode: "0",
  cvs: "1",
  atm: "0",
  credit: "0",
  fee: "28",
  addon_fee: "28",
  description: "28元，付款日+10日",
])

PaymentType.create([
  name: "ATM轉帳",
  argu_name: "ATM",
  barcode: "0",
  cvs: "0",
  atm: "1",
  credit: "0",
  fee: "0.01",
  addon_fee: "0",
  description: "1%，付款日+7日",
])

PaymentType.create([
  name: "信用卡",
  argu_name: "CREDIT",
  barcode: "0",
  cvs: "0",
  atm: "0",
  credit: "1",
  fee: "0.028",
  addon_fee: "0",
  description: "2.80%，交易請款日+10 日",
])
