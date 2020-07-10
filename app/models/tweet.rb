class Tweet < ApplicationRecord
  validates :text, presence: true   # textカラムに対して，presence(存在)していることの制限
  belongs_to :user
  has_many :comments

  # クラスメソッド，個々のインスタンスに結び付けずにクラス全体をみるときに使う，検索・数え上げなど
  def self.search(search)
    return Tweet.all unless search    # フォームに入力がなければ Twee.all
    Tweet.where('text LIKE(?)', "%#{search}%")  # LIKE句による曖昧検索
  end
end
