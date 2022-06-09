class Book < ApplicationRecord
    has_many :bookissues
    has_one_attached :avatar
    validates :name, presence: true
  def height
    avatar.metadata['height']
  end

  def width
    avatar.metadata['width']
  end
    # belongs_to :libraryan
end
