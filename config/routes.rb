QNA::Application.routes.draw do
  resources :questions do
    resources :answers
  end

  resources :responses
  root to: "questions#index"
end
