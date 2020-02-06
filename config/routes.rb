Rails.application.routes.draw do
  resources :departamentos, only: [:new, :create, :index, :show, :destroy]
  resources :produtos, only: [:new, :create, :destroy]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  root "produtos#index"
end
