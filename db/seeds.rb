user = User.create(name: 'Default User', email: 'default-user@example.com')

3.times do |i|
  Message.create(user: user, content: "Message#{i + 1}")
end
