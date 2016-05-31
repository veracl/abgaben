require 'sinatra'

todos = ["Einkaufen", "Putzen"]
done = []

get '/' do
	haml :index, :locals => {:todos => todos, :done => done}
end

post '/delete' do
	todo = params[:todo]
	todos.delete(todo)
	done.push(todo)
	redirect to('/')
end

post '/new' do
	newtodo = params[:newtodo]
	if !(newtodo.length == 0)
		todos.push(newtodo)
	end
	redirect to('/')
end

get '/empty' do
	done = []
	redirect to('/')
end
