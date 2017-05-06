Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ruta raiz de la aplicacion
  root 'users#my_portfolio'
  #ruta get de portafolio de usuario
  get 'my_portfolio', to: 'users#my_portfolio'

  #ruta de busqueda de stocks
  get 'search_stocks', to: 'stocks#search'

end
