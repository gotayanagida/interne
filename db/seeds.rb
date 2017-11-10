# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new(name:"柳田豪太（インターン）",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"gotayanagida5@gmail.com",gender:0,birthday:"1993/6/7",profile_photo_url:"pf.jpg",employment_status:1,home_photo_url:"home.png")
user.save!
user = User.new(name:"佐藤翔野",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"otas8070@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf.jpg",employment_status:1,home_photo_url:"home.png")
user.save!
user = User.new(name:"柳田豪太（社員）",password:"interne",department:"マーケティング本部",position:"部長",email:"a@a.com",gender:1,birthday:"1980/1/1",profile_photo_url:"pf.jpg",employment_status:0,home_photo_url:"home.png")
user.save!

Company.create(name:"株式会社インテルネ",hp_addr:"http://interne.co.jp",number_of_interns:"-10",home_photo_url:"home.png",icon_photo_url:"company.gif")

CompanyUser.create(user_id:3,company_id:1)

Stamp.create(url:"nico.png", name:"nico")
Stamp.create(url:"mima.png", name:"mima")
Stamp.create(url:"suba.gif", name:"suba")
Stamp.create(url:"gan.png", name:"gan")
Stamp.create(url:"yoku.png", name:"yoku")　
