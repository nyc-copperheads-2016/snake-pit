post '/snakes/:id/skins' do
  snake = Snake.find(params[:id])

  # Snake.new    === snake.skins.build(params)
  # Snake.create === snake.skins.create

  if snake.skins.create
    if request.xhr?
      content_type :json
      # { count: snake.skins.length }
      snake.to_json include: :skins
    else
      redirect '/'
    end
  else
    redirect '/?error=unable_to_shed_skin'
  end
end

