# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, default: { format: { with: :json } }, path: '', path_names: {
                                                                       sign_in: 'login',
                                                                       sign_out: 'logout',
                                                                       registration: 'signup'
                                                                     },
                      controllers: {
                        sessions: 'admins/sessions',
                        registrations: 'admins/registrations'
                      }

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
end
