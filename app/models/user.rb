class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :add_color
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :items
  has_many :tips

  enum color: {
    red: 0,
    blue: 1,
    green: 2,
    yellow: 3,
    purple: 4,
    orange: 5,
    pink: 6,
    black: 7,
    gold: 8
  }
  #validates :color, inclusion: { in: colors.keys}

  def add_color
    puts self.color
    rand_number = User.colors.values.sample
    puts rand_number
    self.color = User.colors.values.sample if self.color.nil?
  end
end
