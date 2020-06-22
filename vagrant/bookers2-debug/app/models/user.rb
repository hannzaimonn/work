class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

  has_many :followers, through: :follower_relationships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :name, presence: true, uniqueness: true,
                  length: {minimum: 2, maximum: 20}
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :introduction, length: {maximum: 50}
  def self.search(search, word)
            if search == "1"
                    @user = User.where(['name LIKE ?', "#{word}%"])
            elsif search == "2"
                    @user = User.where(['name LIKE ?', "%#{word}"])
            elsif search == "3"
                    @user = User.where(['name LIKE ?', "#{word}"])
            elsif search == "4"
                    @user = User.where(['name LIKE ?', "%#{word}%"])
            else
                    @user = User.all
            end
    end


  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end

