class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipe/new' do #loads new form
    erb :new
  end

  get '/recipe' do  #loads index pg
    @recipes = Recipe.all
    erb :index
  end

  get '/recipe/:id' do  #loads display pg
    @recipe = Recipe.find_by_id(params[:id])
    erb :display
  end

  get '/recipe/:id/edit' do  #edit recipe
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipe/:id' do  #update recipe
    @recipe = Recipe.find_by_id(params[:is])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to '/recipe/#{@recipe.id}'
  end

  get '/recipe' do  #creates a recipe
    @recipe = Recipe.create(:name => params[:name], :recipe => params[:recipe])
    @recipe.save
  end

end
