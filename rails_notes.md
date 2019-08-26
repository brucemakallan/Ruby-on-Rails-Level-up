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

#### Controllers
- `rails generate controller Welcome index` # Controller Welcome with action index

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

#### 

#### 

#### 

#### 

#### 

#### 

#### 

#### 

#### 

#### 
