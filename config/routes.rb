Rails.application.routes.draw do
  root "flights#index"
	get "flights/index"
end
