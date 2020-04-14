class Ping < ApplicationRecord
  validates_presence_of :time
  belongs_to :user
  has_many :pongs
end
