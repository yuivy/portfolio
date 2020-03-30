Rails.application.routes.draw do
  get 'posts/index' => 'posts#index'
  # 投稿一覧ページ
  get 'posts/new' => 'posts#new'
  # 新規投稿ページ
  post 'posts/create' => 'posts#create'
  # 投稿内容を受け取る
  get 'posts/:id' => 'posts#show'
  # 投稿詳細ページ
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
