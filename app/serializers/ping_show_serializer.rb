class PingShowSerializer < ActiveModel::Serializer
  attributes :id, :time, :store

  attribute :pongs do
    ActiveModel::Serializer::CollectionSerializer.new(object.pongs.where(active: true, status:('accepted' || 'pending')), serializer: PongsSerializer)
  end

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end
end