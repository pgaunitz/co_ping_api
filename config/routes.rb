Rails.application.routes.draw do
  get 'pings/create'
    mount_devise_token_auth_for 'User', at: '/auth', skip: [:omniauth_callbacks]
    resources :pings, only: [:create]
end
