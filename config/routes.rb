Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/health', to: proc { [200, {}, ['status: OK!']] }
end
