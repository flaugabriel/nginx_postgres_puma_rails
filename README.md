# nginx_postgres_puma_rails

### para executar este projeto.
### Na pasta principal executar no terminal o comando para criar as imagens
$ docker-compose build
$ docker-compose down 
### Subir os containers 
$ docker-compose up -d

### Para criar um projeto com rails

$ docker-compose run app bundle exec rails new . -d postgresql
### Para atualizar as imagens

$ docker-compose build
$ docker-compose down 
### Alterar o arquivo config/database.yml


default: &default adapter: postgresql encoding: unicode host: db username: postgres password: mypassword pool: 5 development: <<: *default database: myapp_development test: <<: *default database: myapp_test production: <<: *default database: myapp_production


### Criar um CRUD com o nome da tabela users e atribuitos name, email

docker-compose run app bundle exec rails g scaffold user name email
### Criar os bancos de dados no postgres e migrar a tabela users

docker-compose run app bundle exec rails db:drop db:create db:migrate
### Adicionar a linha abaixo no arquivo confi/routes.rb

root to: "users#index"

### Por fim, subir os containers

docker-compose up -d
### Para acessar a aplicação no navegador digite: localhost

