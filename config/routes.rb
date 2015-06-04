Rails.application.routes.draw do
  devise_for :users, :path_prefix =>'auth'
  resources :questions
  resources :users

  post '/randomquestion' => 'questions#randomquestion', as: 'randomquestion'

  get '/randomquestion' => 'questions#randomquestion'

  get '/changepassword' => 'users#changepassword'

  get '/users/new' => redirect('/404')

  get 'myquestions' => 'questions#userquestion'

  devise_scope :user do
    authenticated :user do
      root :to => 'questions#randomquestion', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  unless Rails.application.config.consider_all_requests_local
    get '*not_found', to: redirect('/404')
  end

end
