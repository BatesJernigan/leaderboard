# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [                                                                                                            
  ["Bates Jernigan",100],
  ["Tanner Fritz", 180],
  ["Sarah Lutz", 90],
  ["Cody Leach", 110],
  ["Holden Cloer", 130],
  ["Holden Cloer1", 130],
  ["Holden Cloer2", 130],
  ["Holden Cloer3", 130],
  ["Holden Cloer4", 123],
  ["Holden Cloer5", 134],
  ["Holden Cloer6", 130],
  ["Holden Cloer7", 1354],
  ["Holden Cloer8", 138],
  ["Holden Cloer9", 1332],
  ["Bates", 12],
  ["Bates1", 150],
  ["Bates2", 130],
  ["Bates3", 2930],
  ["Bates4", 13223],
  ["Bates5", 12430],
  ["Bates6", 0]
]                                         


user_list.each do |name,score|
  User.create(
    :name => name,
    :score => score
    )
end