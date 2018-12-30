# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@to_do_group1 = ToDoGroup.create(name: '健康になる', detail: '体調を整えて毎日を元気に')
@to_do_group2 = ToDoGroup.create(name: 'アプリを作る', detail: 'ひとまず物を作ることで次のステップへ')

ToDoMaster.create(to_do_group_id: @to_do_group1.id,
                  name: '朝食を食べる',
                  detail:'朝ごはんを食べることで、体温が上がり免疫が高まる',
                  order_number: 1, to_do_type: 'repeat', deadline_days: 1)
                  
ToDoMaster.create(to_do_group_id: @to_do_group1.id,
                  name: '運動する',
                  detail:'元気な体作り',
                  order_number: 2, to_do_type: 'repeat', deadline_days: 7)

ToDoMaster.create(to_do_group_id: @to_do_group1.id,
                  name: '適切な栄養管理を学ぶ',
                  detail:'食事の栄養バランスも大事',
                  order_number: 3, to_do_type: 'one_time', deadline_days: 7)
                  
ToDoMaster.create(to_do_group_id: @to_do_group1.id,
                  name: '気持ちをリセットするルーティンを決めよう',
                  detail:'一日の区切りの中で生きる',
                  order_number: 4, to_do_type: 'one_time', deadline_days: 7)
                  
ToDoMaster.create(to_do_group_id: @to_do_group1.id,
                  name: '気持ちをリセットするルーティンを行う',
                  detail:'一日の区切りの中で生きる',
                  order_number: 5, to_do_type: 'repeat', deadline_days: 1)
                  
(1..5).each do |n|
  i = n*2 - 1
  ToDoMaster.create(to_do_group_id: @to_do_group2.id,
                  name: "one_time_task#{i}",
                  detail:"detail#{i}",
                  order_number: i, to_do_type: 'one_time', deadline_days: 1)
end

(1..5).each do |n|
  i = n*2
  ToDoMaster.create(to_do_group_id: @to_do_group2.id,
                  name: "repeat_task#{i}",
                  detail:"detail#{i}",
                  order_number: i, to_do_type: 'repeat', deadline_days: 1)
end

