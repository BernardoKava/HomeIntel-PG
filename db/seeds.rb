# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'outflows.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Outflow.new
  t.person_id = row['owner']
  t.outflowtype_id = row['type']
  t.bankaccount_id = row['origin']
  t.year = row['year']
  t.month = row['month']
  t.date_posted = row['date']
  t.amount = row['out']
  t.details = row['desc']
  t.cashflow_id = row['cf']
  t.user_id = row['user_id']
  t.follow_up = row['follow_up']

  t.save
  puts "#{t.details},#{t.date_posted} saved"
end
puts "There are now #{Outflow.count} rows in the table"



csv_text = File.read(Rails.root.join('lib', 'seeds', 'inflows.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Inflow.new
  t.person_id = row['owner']
  t.inflowtype_id = row['type']
  t.bankaccount_id = row['origin']
  t.year = row['year']
  t.month = row['month']
  t.date_posted = row['date']
  t.amount = row['in']
  t.details = row['desc']
  t.cashflow_id = row['cf']
  t.user_id = row['user_id']
  t.follow_up = row['follow_up']

  t.save
  puts "#{t.details},#{t.date_posted} saved"
end
puts "There are now #{Inflow.count} rows in the table"




