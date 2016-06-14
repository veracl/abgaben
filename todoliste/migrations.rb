require 'active_record'
require 'sqlite3'


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db.sqlite3.db'
)

ActiveRecord::Migration.create_table :to_dos do |t|
  t.string :name
  t.boolean :done
end

