# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(name:"柳田豪太",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"gotayanagida5@gmail.com",gender:0,birthday:"1993/6/7",profile_photo_url:"pf_gota.png",employment_status:1,home_photo_url:"home.png",color_1:"#1687ED",color_2:"#14375A",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"佐藤翔野",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"otas8070@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_shoya.png",employment_status:1,home_photo_url:"home.png",color_1:"#ED6716",color_2:"#AC9324",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"小島清信",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"kojima.kiyonobu@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_jima.png",employment_status:1,home_photo_url:"home.png",color_1:"#59DD51",color_2:"#065B17",confirmed_at:"2017-11-16 09:11:00")
user.save!
# user = User.new(name:"小出粋玄",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"suigen.k@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_suigen.png",employment_status:1,home_photo_url:"home.png",confirmed_at:"2017-11-16 09:11:00")
# user.save!
# user = User.new(name:"早川匠",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"hykwtakumin@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_haya.png",employment_status:1,home_photo_url:"home.png",confirmed_at:"2017-11-16 09:11:00")
# user.save!
user = User.new(name:"小出粋玄",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"a@a.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_suigen.png",employment_status:1,home_photo_url:"home.png",color_1:"#575EE4",color_2:"#39065B",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"早川匠",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"b@a.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_haya.png",employment_status:1,home_photo_url:"home.png",color_1:"#E457CC",color_2:"#E45794",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"柳田豪太（社員）",password:"interne",department:"マーケティング本部",position:"部長",email:"gota.yanagida@digital-k.co.jp",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_gota.png",employment_status:0,home_photo_url:"home.png",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"佐藤翔野（社員）",password:"interne",department:"マーケティング本部",position:"部長",email:"shoya.sato@digital-k.co.jp",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_shoya.png",employment_status:0,home_photo_url:"home.png",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"小島清信（社員）",password:"interne",department:"代表取締役社長",position:"",email:"kkojima@interole.com",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_jima.png",employment_status:0,home_photo_url:"home.png",confirmed_at:"2017-11-16 09:11:00")
user.save!

Company.create(name:"株式会社インテルネ",hp_addr:"http://interne.co.jp",home_photo_url:"home.png",icon_photo_url:"icon_interne.png")
Company.create(name:"株式会社インテロール",hp_addr:"http://interole.co.jp/",home_photo_url:"home.png",icon_photo_url:"icon_interole.png")

CompanyUser.create(user_id:1,company_id:1)
CompanyUser.create(user_id:2,company_id:1)
CompanyUser.create(user_id:3,company_id:1)
CompanyUser.create(user_id:1,company_id:2)
CompanyUser.create(user_id:2,company_id:2)
CompanyUser.create(user_id:3,company_id:2)
CompanyUser.create(user_id:4,company_id:1)
CompanyUser.create(user_id:5,company_id:1)
CompanyUser.create(user_id:6,company_id:1)
CompanyUser.create(user_id:7,company_id:1)
CompanyUser.create(user_id:8,company_id:2)

Stamp.create(url:"nico.png", name:"nico")
Stamp.create(url:"mima.png", name:"mima")
Stamp.create(url:"suba.gif", name:"suba")
Stamp.create(url:"gan.png", name:"gan")
Stamp.create(url:"yoku.png", name:"yoku")

Label.create(name:"開発",color:'#603813',company_id:1)
Label.create(name:"営業",color:'#2e3192',company_id:1)
Label.create(name:"企画",color:'#f15a24',company_id:1)

Schedule.create(user_id:1,company_id:1,work_started_at:Time.local(Time.now.year, Time.now.month, Time.now.day+1, 9, 0, 0),work_ended_at:Time.local(Time.now.year, Time.now.month, Time.now.day+1, 18, 0, 0))
Schedule.create(user_id:1,company_id:1,work_started_at:Time.local(Time.now.year, Time.now.month, Time.now.day+2, 9, 0, 0),work_ended_at:Time.local(Time.now.year, Time.now.month, Time.now.day+2, 18, 0, 0))
Schedule.create(user_id:2,company_id:1,work_started_at:Time.local(Time.now.year, Time.now.month, Time.now.day+2, 13, 0, 0),work_ended_at:Time.local(Time.now.year, Time.now.month, Time.now.day+2, 18, 0, 0))

Report.create(user_id:1,schedule_id:1,company_id:1,title:"サンプルレポート",body:"これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。")
Report.create(user_id:1,schedule_id:2,company_id:1,title:"サンプルレポート",body:"これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。")
Report.create(user_id:2,schedule_id:3,company_id:1,title:"サンプルレポート",body:"これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。これはサンプルレポートです。")

Task.create(company_id:1,title:"データ解析",detail:"〇〇サービスのランディングページのデータ解析",status_code:1)
Task.create(company_id:1,title:"データ解析",detail:"〇〇サービスのランディングページのデータ解析",status_code:1)
Task.create(company_id:1,title:"データ解析",detail:"〇〇サービスのランディングページのデータ解析",status_code:1)

TaskSchedule.create(task_id:1,schedule_id:1)
TaskSchedule.create(task_id:2,schedule_id:2)
TaskSchedule.create(task_id:3,schedule_id:3)

TaskLabel.create(task_id:1,label_id:1)
TaskLabel.create(task_id:2,label_id:2)
TaskLabel.create(task_id:3,label_id:3)

TaskUser.create(task_id:1,user_id:1)
TaskUser.create(task_id:2,user_id:1)
TaskUser.create(task_id:3,user_id:2)
