require 'sinatra'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db.sqlite3.db'
)

class ToDo < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

get '/' do
  redirect to('/todos/')
end

# display all todos
get '/todos/' do
  @to_dos = ToDo.where(done: false)
  @dones = ToDo.where(done: true)
  @users = User.all()
  haml :index
end

# update a todo
put '/todos/:id' do
  todo_id = params[:id]
  del = ToDo.find_by(id: todo_id)
  del.done = true
  del.save!
  redirect to('/')
end

# create a new todo
post '/todos/new' do
  newtodo = params[:newtodo]
  uid = params[:uid]
  unless newtodo.empty? || uid.nil?
    ToDo.create(name: newtodo, done: false, users_id: uid)
  end
  redirect to('/')
end

# delete all todos
delete '/todos/' do
  ToDo.where(done: true).delete_all
  redirect to('/')
end

# returns form to create a new user
get '/users/new' do
  haml :newuser
end

# create a new user
post '/users/new' do
  uname = params[:uname]
  unless uname.empty?
    User.create(uname: uname)
  end
  redirect to('/')
end

