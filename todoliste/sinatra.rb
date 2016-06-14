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
  @to_dos = ToDo.where(done: false)
  @dones = ToDo.where(done: true)
  @users = User.all()
  haml :index
end

  todo_id = params[:todo_id]
  del = ToDo.find_by(id: todo_id)
  del.done = true
  del.save!
  redirect to('/')
end

post '/new' do
  newtodo = params[:newtodo]
  uid = params[:uid]
  unless newtodo.empty? || uid.nil?
    ToDo.create(name: newtodo, done: false, users_id: uid)
  end
  redirect to('/')
end

  ToDo.where(done: true).delete_all
  redirect to('/')
end

get '/newuser' do
  haml :newuser
end

post '/newuser' do
  uname = params[:uname]
  unless uname.empty?
    User.create(uname: uname)
  end
  redirect to('/')
end

