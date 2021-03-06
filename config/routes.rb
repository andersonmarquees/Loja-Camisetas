Rails.application.routes.draw do
  resources :departamentos, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  root "produtos#index"
end
