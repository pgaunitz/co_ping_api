class PongShowSerializer < ActiveModel::Serializer
  attributes :id, :item1, :item2, :item3, :status, :total_cost, :ping_phone

  def ping_phone
    object.ping.user.phone_number
  end
end
