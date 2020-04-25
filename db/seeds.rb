Community.create name: 'Craft Academy', code: 'Hqxx5Uk5evmD'
User.create email: 'johan@mail.com', password: 'password', role: 'user', name: 'Johan Bounce', community_id: 1, community_status: 'accepted', phone_number: '070- 123 98 76', address: 'Isafjordsgatan 21, 164 40 Kista'
User.create email: 'philip@mail.com', password: 'password', role: 'user', name: 'Philip Gaunitz', community_id: 1, community_status: 'accepted', phone_number: '073- 246 12 56', address: 'Isafjordsgatan 21, 164 40 Kista'
User.create email: 'emma@mail.com', password: 'password', role: 'user', name: 'Emma Thalen', community_id: 1, community_status: 'accepted', phone_number: '070- 987 12 34', address: 'Isafjordsgatan 21, 164 40 Kista'
User.create email: 'karro@mail.com', password: 'password', role: 'user', name: 'Karro Frostare', community_id: 1, community_status: 'pending', phone_number: '076- 567 12 89', address: 'Isafjordsgatan 21, 164 40 Kista'
User.create email: 'admin@mail.com', password: 'password', role: 'admin', name: 'Thomas Ochman', community_id: 1, community_status: 'accepted', phone_number: '073- 468 97 53', address: 'Isafjordsgatan 21, 164 40 Kista'
Ping.create time: '2020-04-25 17:00', store: 'Ica', active: true, user_id: 2
Ping.create item1: 'Salad', item2: 'Cucumber', item3: 'Orange juice', user_id: 3, ping_id: 1, status: 'pending', active: true