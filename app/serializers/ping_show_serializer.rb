class PingShowSerializer < ActiveModel::Serializer
  attributes :id, :time, :store, :pongs

  def fetch_pongs
    original_pongs = Pong.all.where(ping_id: object.id, active: true)
  end

  def pongs
    binding.pry
    all_pongs = fetch_pongs
    # binding.pry
        user = User.find(all_pongs[0]['user_id'])
        all_pongs[i]['user_name'] = user.name
    # binding.pry
   
    # all_pongs.each do |index|
    #  user = User.find(all_pongs[index]['user_id'])
    #  all_pongs[index]['user_name'] = user.name
     
    # end
  end

  # User.find(original_pong[0]['user_id']).name
  # def user_name
  #   user = User.all.find(object.user_id)
  #   user.name
  # end

  def time
    object.time.strftime('%Y-%m-%d %H:%M')
  end
end