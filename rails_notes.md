# RoR Notes (6.0.0)

#### Getting Started
https://guides.rubyonrails.org/getting_started.html

1. Install Ruby
   1. MAC: https://www.ruby-lang.org/en/documentation/installation/#homebrew
2. Install RVM - Ruby Version Manager
   1. `rvm list`
   2. `rvm --default use <version>`
3. Install Rails `gem install rails`
4. Create new app `rails new <app>`
5. Start the server `rails s`
6. Rails console `rails c`

#### Linting
- Rubocop
  - `.rubocop.yml` for config 
  - `rubocop --auto-gen-config` # For auto config

#### Advanced setup
- `rails new <app> -d postgresql -B -T`
  - `-B` skip bundle install (to be done later)
  - `-T` skip tests
- `rails new authors-haven --api --no-sprockets -d postgresql`
  - `--api` api only
  - `--no-sprockets` remove web assets

#### Controllers
- `rails generate controller Welcome index` # Controller Welcome with action index. Use `rais g ... ` shortcut
- `rails g controller api/v1/articles` # with api versioning

#### Resources
> A resource is the term used for a collection of similar objects, such as articles, people, or animals.  Can do CURD operations on them.

- routes.rb
  `resources :articles`
- `rails routes` # view all routes

#### Forms
```
<%= form_with scope: :article, url: articles_path, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>
 
  <p>
    <%= form.label :text %><br>
    <%= form.text_area :text %>
  </p>
 
  <p>
    <%= form.submit %>
  </p>
<% end %>
```

#### Models
> You don't have to declare attributes inside Rails models, as that will be done automatically by **Active Record**.
> NB: Models generate migration files

- `rails generate model Article title:string text:text`

#### Migrations
- `rails db:migrate`
- `rails db:migrate RAILS_ENV=production` # specifying environments

#### Troubleshooting
- Stopping a rails server process when `Ctr+C` fails
  `lsof -wni tcp:3000`
  `kill -9 <PID>`

#### 

#### 

#### 

#### 

#### 

#### 

#### 

#### 

#### 
