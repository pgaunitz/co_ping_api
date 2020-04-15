class Community < ApplicationRecord
  validates_presence_of :code, :name
  has_many :users
end
