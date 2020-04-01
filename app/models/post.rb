class Post < ApplicationRecord
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
    # インスタンスメソッドを定義することで投稿に紐づいているuser情報が表示される
  end
end
