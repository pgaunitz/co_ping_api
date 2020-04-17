class PingShowSerializer < ActiveModel::Serializer
  attributes :id, :time, :store, :pongs

  def pongs
    Pong.all.where(ping_id: object.id, active: true)
  end

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end
end