class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}
  validates :introduce, {presence: true, length:{maximum: 255}}
  validates :product, {presence: true, length:{maximum: 50}}
  validates :game_mode, {presence: true, length:{maximum: 50}}
  def posts
    return Post.where(user_id: self.id)
  end
end
