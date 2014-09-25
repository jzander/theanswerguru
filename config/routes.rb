AnswerguruPg::Application.routes.draw do

root to: 'decisions#home'

  resources :decisions, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :criteria, only: [:index, :new, :create, :destroy]
      resources :answers, only: [:index, :new, :create, :update, :destroy]

  end

  get 'criteria_answers' => 'criteria_answers#index', as: :crit_answer
  post 'criteria_answers/:id' => 'criteria_answers#create', as: :create_criteria_answer
  get 'criteria_answers/:id' => 'criteria_answers#show', as: :criteria_answer
  get 'criteria_answers/:id/edit' => 'criteria_answers#edit', as: :edit_criteria_answer
  get 'criteria_answer/:id/new' => 'criteria_answers#new', as: :new_criteria_answer

  get 'decisions/home' => 'decisions#home', as: :home
  # get 'decisions/result' => 'decisions#show', as: :show

  resource :session, only: [:new, :create, :destroy]

  get 'users' => 'users#index', as: :users
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  put 'users/:id' => 'users#update'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

end
