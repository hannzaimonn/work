class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	# attachment :image
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

    def self.search(search, word)
        if search == "1"
                        @book = Book.where(["title LIKE?","#{word}%"])
        elsif search == "2"
                        @book = Book.where(["title LIKE?","%#{word}"])
        elsif search == "3"
                        @book = Book.where(["title LIKE?","#{word}"])
        elsif search == "4"
                        @book = Book.where(["title LIKE?","%#{word}%"])
        else
                        @book = Book.all
        end
    end


end
