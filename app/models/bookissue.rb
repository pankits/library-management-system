class Bookissue < ApplicationRecord
  belongs_to :rentel
  belongs_to :book
end
