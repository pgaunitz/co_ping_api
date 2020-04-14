class PingIndexSerializer < ActiveModel::Serializer
  attributes :id, :time, :store, :user_name

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end

  def user_name
    user = User.all.find(object.user_id)
    user.name
  end
end
