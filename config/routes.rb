Rails.application.routes.draw do

    resources :comments, only: [:create, :update]
  # end
  
  get '/' => 'home#top'
  # トップページ
  get '/about' => 'home#about'
  # サービス紹介ページ
  get 'users/index' => 'users#index'
  # ユーザー一覧ページ
  get 'users/:id' => 'users#show'
  # ユーザー詳細ページ
  post 'users/create' => 'users#create'
  # ユーザーの保存
  get '/signup' => 'users#new'
  # 新規ユーザー登録
  get 'users/:id/edit' => 'users#edit'
  # ユーザーの編集
  post 'users/:id/update' => 'users#update'
  # ユーザー編集後の内容を受け取る
  get 'posts/index' => 'posts#index'
  # 投稿一覧ページ
  get 'posts/new' => 'posts#new'
  # 新規投稿ページ
  post 'posts/create' => 'posts#create'
  # 投稿内容を受け取る
  get 'posts/:id' => 'posts#show'
  # 投稿詳細ページ
  get 'posts/:id/edit' => 'posts#edit'
  # 投稿編集ページ
  post 'posts/:id/update' => 'posts#update'
  # 編集後の投稿内容を受け取る
  post 'posts/:id/destroy' => 'posts#destroy'
  # 投稿内容の削除
  get '/login' => 'users#login_form'
  # ユーザーのログイン
  post '/login' => 'users#login'
  # ログイン情報を受け取る
  post '/logout' => 'users#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'comments/:id/edit' => "comments#edit"
  # コメント編集ページ
  post 'comments/:id/destroy' => 'comments#destroy'
end
