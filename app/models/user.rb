class User < ActiveRecord::Base
  after_create :initialize_with_wallet
  has_many :trades
  has_one :wallet
  belongs_to :network
  belongs_to :user_leaderboard

  validates :username, presence: true, length: { minimum: 6, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def default_wallet
    self.wallet
  end

  private

    def initialize_with_wallet
      Wallet.create(user: self)
    end

end
