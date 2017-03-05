Rails.application.routes.draw do

  root 'pages#index'
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end

  resources :posts, :animals
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get 'users/:id' => 'users#show', as: :user_show
  get 'found_form' => 'posts#found_form'
  get 'found_submit' => 'posts#found_submit'
  get 'filter_based_on_location' => 'posts#filter_based_on_location'
  get 'add' => 'animals#add'
  get 'new2' => 'animals#new2'
  post 'create2' => 'animals#create2'

  # JSON
  get 'posts_json' => 'posts#index_json'
  get 'animals_json' => 'animals#index_json'

end
