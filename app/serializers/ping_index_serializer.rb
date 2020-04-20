class PingIndexSerializer < ActiveModel::Serializer
  attributes :id, :time, :store, :user_name, :phone_number

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end

  def user_name
    object.user.name
  end

  def phone_number
    object.user.phone_number
  end
end
