class Shoe < ActiveRecord::Base
  belongs_to :user, required: true

  validates :name, :amount, presence: true
  
end
