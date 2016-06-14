require 'active_record'
require 'sqlite3'


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db.sqlite3.db'
)

ActiveRecord::Migration.create_table :users do |u|
  u.string :uname
end

ActiveRecord::Migration.add_reference :to_dos, :users, index: true
ActiveRecord::Migration.add_foreign_key :to_dos, :users
