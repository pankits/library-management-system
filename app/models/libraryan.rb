class Libraryan < ApplicationRecord
    has_one :user, as: :type_id, dependent: :destroy
    accepts_nested_attributes_for :user
    has_many :books ,dependent: :destroy
   

    
end
