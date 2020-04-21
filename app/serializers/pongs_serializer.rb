class PongsSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :item1, :item2, :item3, :status, :phone_number

  def user_name
    object.user.name
  end

  def phone_number
    object.user.phone_number
  end
end
