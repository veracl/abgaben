require 'sinatra'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db.sqlite3.db'
)

class ToDo < ActiveRecord::Base
end



get '/' do
  @to_dos = ToDo.where(done: false)
  @dones = ToDo.where(done: true)
  haml :index
end

post '/delete' do
  todo_id = params[:todo_id]
  del = ToDo.find_by(id: todo_id)
  del.done = true
  del.save!
  redirect to('/')
end

post '/new' do
  newtodo = params[:newtodo]
  unless newtodo.empty?
    ToDo.create(name: newtodo, done: false)
  end
  redirect to('/')
end

get '/empty' do
  ToDo.where(done: true).delete_all
  redirect to('/')
end
