class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :books




  attachment :profile_image

   validates :name, presence: true, uniqueness: true,
                  length: {minimum: 2, maximum: 20}

   validates :introduction, length: {maximum: 50}
end
