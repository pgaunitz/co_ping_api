class PongsSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :item1, :item2, :item3

  def user_name
    object.user.name
  end
end
