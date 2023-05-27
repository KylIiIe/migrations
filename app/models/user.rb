class User < ApplicationRecord
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
end
