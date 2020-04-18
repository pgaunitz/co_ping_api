class PongsSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :item1, :item2, :item3, :status, :total_cost

  def user_name
    object.user.name
  end
end
