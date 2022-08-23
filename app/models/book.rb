class Book < ApplicationRecord
  belongs_to :book
  validates :title, :body, presence: true
  
  
end
