SimpleText::Engine.routes.draw do
  resources :documents, only: [:edit, :update, :index, :new, :create]
end
