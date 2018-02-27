Rails.application.routes.draw do
  resources :bus_operators 

  post 'bus_operators/:id/qualify', as: "qualify_bus_operator", to: "bus_operators#qualify", controller: 'bus_operators'
  get 'bus_operators/:id/qualifications', as: "qualifications_bus_operator", to: "bus_operators#qualifications", controller: 'bus_operators'  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
