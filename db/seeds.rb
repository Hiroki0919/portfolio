# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  Tag.create([
    { name: '就職' },
    { name: '仕事' },
    { name: 'スポーツ' },
    { name: '学校' },
    { name: '受験' },
    { name: '友人関係' }
  ])
end

if Rails.env == 'production'
  Tag.create([
    { name: '就職' },
    { name: '仕事' },
    { name: 'スポーツ' },
    { name: '習い事'},
    { name: '学校' },
    { name: '受験' },
    { name: '友人関係' },
    { name: '恋愛'},
    { name: '家族関係'}
  ])
end