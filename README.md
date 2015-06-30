#Sinatra with ActiveRecord

## Setup
0. Create new project folder & `cd` into it
0. `bundle init` to create a blank Gemfile
0. Add needed gems to the Gemfile and `bundle install`
0. In your main app file, `require sinatra/activerecord`
0. Create a blank file in root of the project called `Rakefile`
0. `require sinatra/activerecord/rake` and your main app file in your `Rakefile`
0. Now you can create migrations with `bundle exec rake db:create_migration NAME=your_migration_name`
0. After creating a migration, edit its `change` method to reflect the changes you want to make to your database
0. Run the migration with `bundle exec rake db:migrate`
0. Further schema changes should be implemented by creating & defining new migrations, then running them.

## Other tips
0. You might want to add your sqlite3 database file to `.gitignore`
0. Your model classes should be named the singular of their associated table, like `class User` for the users table and `class Dog` for the dogs table.
0. Don't forget to require the file (or files) where you define your models in your main app file

