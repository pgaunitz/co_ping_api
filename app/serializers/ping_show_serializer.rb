# frozen_string_literal: true

class PingShowSerializer < ActiveModel::Serializer
  attributes :id, :time, :store, :pongs

  attribute :pongs do
    ActiveModel::Serializer::CollectionSerializer.new(object.pongs, serializer: PongsSerializer)
  end

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end
end
