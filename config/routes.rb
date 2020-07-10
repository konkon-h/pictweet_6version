Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tweets, only: [:index, :new, :create , :destroy, :edit, :update, :show]
  root to: 'tweets#index'
  resources :tweets do
    # ルーティングのネストにより，とある1つのtweetに含まれるcommentを1つ作成するためのパス
    # paramsに:tweet_idカラムが追加される
    resources :comments, only: :create
    collection do
      # :idなしでルーティングをネストして生成（:idを付けたい場合はmember指定）
      get 'search'
    end
  end
  resources :users, only: :show
end
