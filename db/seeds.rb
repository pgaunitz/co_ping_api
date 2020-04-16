Community.create name: 'The best community ever', code: 'Hqxx5Uk5evmD'  
User.create email: 'betty@mail.com', password: 'password', role: 'user', name: 'Betty Baconsson', community_id: 1
User.create email: 'possum@mail.com', password: 'password', role: 'user', name: 'Awesome Possumsson', community_id: 1
User.create email: 'user@mail.com', password: 'password', role: 'user', name: 'User Usersson', community_id: 1
User.create email: 'admin@mail.com', password: 'password', role: 'admin', name: 'Admin', community_id: 1
Ping.create time: '2020-06-30 15:00', store: 'Systembolaget', active: true, user_id: 1
Ping.create time: '2020-05-22 18:00', store: 'ICA', active: true, user_id: 2