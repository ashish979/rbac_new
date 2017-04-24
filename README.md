# Fee and admission management (FAM)
------------------------------------

Steps to run the application:
1. Clone the application on your system.
2. Create database.yml and secrets.yml from example files and put correct config in them.
3. Run ```bundle install``` to install application dependencies.
4. Run ```rake db:create db:migrate db:seed``` to create database schema.
5. Run thin start -C config/thin/thin_development.yml to run the application.
6. Open localhost:5500 on your browser. 

