# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.create(name:"Red",main:'#f44336',bg:'#ffebee',grad_1:'#f44336',grad_2:'#f44336')
Color.create(name:"Pink",main:'#E91E63',bg:'#FCE4EC',grad_1:'#E91E63',grad_2:'#E91E63')
Color.create(name:"Purple",main:'#9C27B0',bg:'#F3E5F5',grad_1:'#9C27B0',grad_2:'#9C27B0')
Color.create(name:"Deep Purple",main:'#673AB7',bg:'#EDE7F6',grad_1:'#673AB7',grad_2:'#673AB7')
Color.create(name:"Indigo",main:'#3F51B5',bg:'#E8EAF6',grad_1:'#3F51B5',grad_2:'#3F51B5')
Color.create(name:"Blue",main:'#2196F3',bg:'#E3F2FD',grad_1:'#2196F3',grad_2:'#2196F3')
Color.create(name:"Light Blue",main:'#03A9F4',bg:'#E1F5FE',grad_1:'#03A9F4',grad_2:'#03A9F4')
Color.create(name:"Cyan",main:'#00BCD4',bg:'#E0F7FA',grad_1:'#00BCD4',grad_2:'#00BCD4')
Color.create(name:"Teal",main:'#009688',bg:'#E0F2F1',grad_1:'#009688',grad_2:'#009688')
Color.create(name:"Green",main:'#4CAF50',bg:'#E8F5E9',grad_1:'#4CAF50',grad_2:'#4CAF50')
Color.create(name:"Light Green",main:'#8BC34A',bg:'#F1F8E9',grad_1:'#8BC34A',grad_2:'#8BC34A')
Color.create(name:"Lime",main:'#CDDC39',bg:'#F9FBE7',grad_1:'#CDDC39',grad_2:'#CDDC39')
Color.create(name:"Yellow",main:'#FFEB3B',bg:'#FFFDE7',grad_1:'#FFEB3B',grad_2:'#FFEB3B')
Color.create(name:"Amber",main:'#FFC107',bg:'#FFF8E1',grad_1:'#FFC107',grad_2:'#FFC107')
Color.create(name:"Orange",main:'#FF9800',bg:'#FFF3E0',grad_1:'#FF9800',grad_2:'#FF9800')
Color.create(name:"Deep Orange",main:'#FF5722',bg:'#FBE9E7',grad_1:'#FF5722',grad_2:'#FF5722')
Color.create(name:"Brown",main:'#795548',bg:'#EFEBE9',grad_1:'#795548',grad_2:'#795548')
Color.create(name:"Grey",main:'#9E9E9E',bg:'#FAFAFA',grad_1:'#9E9E9E',grad_2:'#9E9E9E')
Color.create(name:"Blue Grey",main:'#607D8B',bg:'#ECEFF1',grad_1:'#607D8B',grad_2:'#607D8B')

user = User.new(name:"柳田豪太",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"gotayanagida5@gmail.com",gender:0,birthday:"1993/6/7",profile_photo_url:"pf_gota.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"佐藤翔野",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"otas8070@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_shoya.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"小島清信",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"kojima.kiyonobu@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_jima.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
# user = User.new(name:"小出粋玄",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"suigen.k@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_suigen.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
# user.save!
# user = User.new(name:"早川匠",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"hykwtakumin@gmail.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_haya.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
# user.save!
user = User.new(name:"小出粋玄",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"a@a.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_suigen.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"早川匠",password:"interne",university:"慶應義塾大学",department:"環境情報学部",grade:1,email:"b@a.com",gender:0,birthday:"1990/1/1",profile_photo_url:"pf_haya.png",employment_status:1,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"柳田豪太（社員）",password:"interne",department:"マーケティング本部",position:"部長",email:"gota.yanagida@digital-k.co.jp",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_gota.png",employment_status:0,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"佐藤翔野（社員）",password:"interne",department:"マーケティング本部",position:"部長",email:"shoya.sato@digital-k.co.jp",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_shoya.png",employment_status:0,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!
user = User.new(name:"小島清信（社員）",password:"interne",department:"代表取締役社長",position:"",email:"kkojima@interole.com",gender:0,birthday:"1980/1/1",profile_photo_url:"pf_jima.png",employment_status:0,home_photo_url:"home.jpg",confirmed_at:"2017-11-16 09:11:00")
user.save!

Company.create(name:"株式会社インテルネ",hp_addr:"http://interne.co.jp",home_photo_url:"home.jpg",icon_photo_url:"icon_interne.png")
Company.create(name:"株式会社インテロール",hp_addr:"http://interole.co.jp/",home_photo_url:"home.jpg",icon_photo_url:"icon_interole.png")

CompanyUser.create(user_id:1,company_id:1,color_id:1)
CompanyUser.create(user_id:2,company_id:1,color_id:2)
CompanyUser.create(user_id:3,company_id:1,color_id:3)
CompanyUser.create(user_id:1,company_id:2,color_id:1)
CompanyUser.create(user_id:2,company_id:2,color_id:2)
CompanyUser.create(user_id:3,company_id:2,color_id:3)
CompanyUser.create(user_id:4,company_id:1,color_id:1)
CompanyUser.create(user_id:5,company_id:1,color_id:2)
CompanyUser.create(user_id:6,company_id:1,color_id:3)
CompanyUser.create(user_id:7,company_id:1,color_id:1)
CompanyUser.create(user_id:8,company_id:2,color_id:2)

Stamp.create(url:"nico.png", name:"nico")
Stamp.create(url:"mima.png", name:"mima")
Stamp.create(url:"suba.gif", name:"suba")
Stamp.create(url:"gan.png", name:"gan")
Stamp.create(url:"yoku.png", name:"yoku")

Label.create(name:"開発",color:'#00ff00',company_id:1)
Label.create(name:"営業",color:'#0000ff',company_id:1)
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
