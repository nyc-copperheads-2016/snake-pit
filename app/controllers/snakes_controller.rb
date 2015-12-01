get '/' do
  @snakes = Snake.all
  erb :'snakes/index'
end

get '/snakes/new' do
  erb :'snakes/form'
end

post '/snakes' do
  snake = Snake.new(name: params[:name], species: params[:species])
  if snake.save
    redirect '/'
  else
    erb :'snakes/form'
  end
end
