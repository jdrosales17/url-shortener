# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'links#index'

  resources :links, only: %i[new create show], param: :token do
    get :info
  end
end
