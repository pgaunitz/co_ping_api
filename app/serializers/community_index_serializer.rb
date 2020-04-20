class CommunityIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :email 
end
