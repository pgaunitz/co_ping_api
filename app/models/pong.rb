class Pong < ApplicationRecord
  validates_presence_of :item1
  belongs_to :user
  belongs_to :ping
end
