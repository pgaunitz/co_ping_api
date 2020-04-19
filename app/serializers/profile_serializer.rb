class ProfileSerializer < ActiveModel::Serializer
  attributes :id,
             :adress,
             :name,
             :phone_number,
             :about_me,
             :community_status,
             :community

  def community
    Community.find(User.find(object[:id]).community_id).name
  end
end
