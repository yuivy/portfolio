Rails.application.routes.draw do
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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
