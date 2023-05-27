class LibraryCard < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :books
  belongs_to :user
  validates :library, presence: true
  validates :user, presence: true, uniqueness: { scope: [:library] }
  validates :books, presence: false

  def self.add_library_card(user_id, library_id)
    user = User.find(user_id)
    library = Library.find(library_id)
    library_card = LibraryCard.new(user:, library:)
    if library_card.valid?
      library_card.save
      LibraryCard.last
    else
      puts library_card.errors.full_messages
      nil
    end
  end

  def self.update_library_card(user_id, library_id, id)
    library = Library.find(library_id)
    user = User.find(user_id)
    library_card_id = LibraryCard.find(id)
    library_card = LibraryCard.new(user:, library:)
    if library_card.valid?
      library_card_id.update(user:, library:)
      library_card_id
    else
      puts library_card.errors.full_messages
      nil
    end
  end
end
