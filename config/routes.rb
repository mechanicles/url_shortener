# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'short_urls#index'
  get '/:short_url_token', to: 'short_urls#redirect_to_original_url'

  resources :short_urls, only: %i[index create]
end
