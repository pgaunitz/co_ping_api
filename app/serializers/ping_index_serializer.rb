class PingIndexSerializer < ActiveModel::Serializer
  attributes :id, :time, :store

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end
end
