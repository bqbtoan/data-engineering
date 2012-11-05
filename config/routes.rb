DataEngineering::Application.routes.draw do
  resources :import, :only => [:show, :new, :create]
  root :to => 'import#new'
end