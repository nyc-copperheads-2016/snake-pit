post '/snakes/:id/skins' do
  snake = Snake.find(params[:id])
  if snake.skins.create
    if request.xhr?
      content_type :json
      { count: snake.skins.length }.to_json
    else
      redirect '/'
    end
  else
    redirect '/?error=unable_to_shed_skin'
  end
end

