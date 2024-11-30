# ACTION PDF

docker
access to the shell
```
  docker-compose exec app /bin/bash
```

install action text
```
  bundle exec rails action_text:install
```

db
```
bundle exec rails db:setup
bundle exec rails db:migrate
```

run the server inside the container
```
bundle exec rails s -b 0.0.0.0
```
