require 'sinatra'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db.sqlite3.db'
)

class ToDo < ActiveRecord::Base
end

class Done < ActiveRecord::Base
end

#ActiveRecord::Migration.create_table :to_dos do |t|
#  t.string :name
#end

#ActiveRecord::Migration.create_table :dones do |t|
#  t.string :name
#end

#ToDo.create(name: "Putzen")

get '/' do
  @to_dos = ToDo.all()
  @dones = Done.all()
  haml :index
end

post '/delete' do
  todo = params[:todo]
  del = ToDo.find_by(name: todo)
  del.destroy
  Done.create(name: todo)
  redirect to('/')
end

post '/new' do
  newtodo = params[:newtodo]
  if !(newtodo.length == 0)
    ToDo.create(name: newtodo)
  end
  redirect to('/')
end

get '/empty' do
  Done.delete_all
  redirect to('/')
end
