## 起動方法
1. `docker compose build`
2. `docker compose run --rm api rails db:create`
3. `docker compose run --rm api rails db:migrate`
4. `docker compose run --rm api rails db:seed`
5. docker compose up -d
6. http://localhost:25021/up へアクセス -> 緑色のページが表示されたらおk！

## API リファレンス
### Swaggerの閲覧方法
1. `docker compose run --rm api bash -c "OPENAPI=1 rspec spec/requests/"` -> doc/openapi.yamlが生成される
2. VSCodeの拡張機能[Swagger Viewer](https://marketplace.visualstudio.com/items?itemName=Arjun.swagger-viewer)でopenapi.yaml閲覧する

上記の方法はまだ不完全なので、下記のテストコードを直接見る方が、信憑性が高いです。
- [users_spec.rb](https://github.com/BokunoLab-p2hacks/chat-api/blob/main/spec/requests/users_spec.rb)
- [messages_spec.rb](https://github.com/BokunoLab-p2hacks/chat-api/blob/main/spec/requests/messages_spec.rb)
