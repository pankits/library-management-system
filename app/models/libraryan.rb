class Libraryan < ApplicationRecord
    has_one :user, as: :type_id, dependent: :destroy
    accepts_nested_attributes_for :user
    # has_many :books ,dependent: :destroy
     validates :name, presence: true , format: { with: /\A[a-zA-Z]+\z/,
     message: "only allows letters" },length: { minimum: 2 }
     validates :password, length: { in: 6..20 }
     validates :age, length: { in: 1..3 }

    
end
