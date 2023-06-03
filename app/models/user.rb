class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :library_card
  validates :name, presence: true

  def self.add_user(name)
    user = User.new(name:)
    if user.valid?
      user.save
      User.last
    else
      puts user.errors.full_messages
      nil
    end
  end

  def self.update_user(name, id)
    user_id = User.find(id)
    user = User.new(name:)
    if user.valid?
      user_id.update(name:)
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
