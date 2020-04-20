Community.create name: 'The best community ever', code: 'Hqxx5Uk5evmD'  
User.create email: 'betty@mail.com', password: 'password', role: 'user', name: 'Betty Baconsson', community_id: 1, community_status: 'accepted', phone_number: '123456789', address: 'Baconstreet 37 floor 2'
User.create email: 'possum@mail.com', password: 'password', role: 'user', name: 'Awesome Possumsson', community_id: 1, community_status: 'accepted', phone_number: '98765321', address: 'Baconstreet 37 floor 1'
User.create email: 'user@mail.com', password: 'password', role: 'user', name: 'User Usersson', community_id: 1, community_status: 'accepted', phone_number: '38956789', address: 'Baconstreet 37 floor 3'
User.create email: 'admin@mail.com', password: 'password', role: 'admin', name: 'Admin', community_id: 1, community_status: 'accepted', phone_number: '38956789', address: 'Baconstreet 37 basement'
User.create email: 'berry@mail.com', password: 'password', role: 'user', name: 'User Usersson', community_id: 1, community_status: 'pending', phone_number: '38956789', address: 'Baconstreet 37 floor 3'
User.create email: 'pungrattan@mail.com', password: 'password', role: 'admin', name: 'Admin', community_id: 1, community_status: 'pending', phone_number: '38956789', address: 'Baconstreet 37 basement'
Ping.create time: '2020-06-30 15:00', store: 'Systembolaget', active: true, user_id: 1
Ping.create time: '2020-05-22 18:00', store: 'ICA', active: true, user_id: 2