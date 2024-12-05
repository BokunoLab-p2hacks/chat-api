## 起動方法
1. `docker compose build`
2. `docker compose run --rm api rails db:create`
3. `docker compose run --rm api rails db:migrate`
4. docker compose up -d
5. http://localhost:25021/up へアクセス -> 緑色のページが表示されたらおk！

## API リファレンス
Swaggerをまだ用意できていないので、以下をリファレンスとしてください。
- [users_spec.rb](https://github.com/BokunoLab-p2hacks/chat-api/blob/main/spec/requests/users_spec.rb)
- [messages_spec.rb](https://github.com/BokunoLab-p2hacks/chat-api/blob/main/spec/requests/messages_spec.rb)
