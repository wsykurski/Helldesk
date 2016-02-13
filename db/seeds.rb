# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.find_by_name 'admin'
unless u.nil?
  u.delete
end

User.create name: 'admin', email: 'admin@admin.com',
            password: 'zaq12WSX', password_confirmation: 'zaq12WSX',
            admin:true
