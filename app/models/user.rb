class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :library_card
  has_one_attached :avatar
  validates :name, presence: true

  def self.add_user(name, avatar)
    user = User.new(name:, avatar:)
    if user.valid?
      user.save
      User.last
    else
      puts user.errors.full_messages
      nil
    end
  end

  def self.update_user(name, avatar, id)
    user_id = User.find(id)
    user = User.new(name:, avatar:)
    if user.valid?
      user_id.update(name:, avatar:)
      user_id
    else
      puts user.errors.full_messages
      nil
    end
  end

  def self.delete_user(id)
    user = User.find(id)
    user.delete
  end
end
