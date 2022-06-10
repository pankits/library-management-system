class Rentel < ApplicationRecord
    has_one :user, as: :type_id, dependent: :destroy
    accepts_nested_attributes_for :user
    has_many :bookissues
  
end
