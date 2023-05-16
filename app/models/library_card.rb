class LibraryCard < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :books
  has_one :user
end