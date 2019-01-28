Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root route for index get me the index view from controller posts 
  root 'posts#index', as: 'home'

  #Normal Route for normal pages get me the index view from controller pages  
  get 'about' => 'pages#about' , as:'about' 

  resources :posts do 
  	resources :comments
  end
  
end
