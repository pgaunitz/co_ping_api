# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates_presence_of :role, :name
  enum role: [ :admin, :user ]
  enum community_status: [ :pending, :accepted, :rejected ]
  has_many :pings
  has_many :pongs
  belongs_to :community
end
