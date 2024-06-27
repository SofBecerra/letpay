class User < ApplicationRecord
has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :items
  before_create :assign_avatar_random

def assign_avatar_random
  avatar_path = "a/avatars/avatar#{avatar_number}.jpg"
  avatar.attached(io: File.open(Rails.root.join('app', 'assets', 'images', avatar_path)), filename: "avatar#{avatar_number}.jpg", content_type: 'image/jpg')
end

end
