# SimpleText
A simple markdown document system to present documents such as Terms & Conditions or a Privacy Policy.
## Usage
Generate the migration and run migrations:
```Ruby
rake simple_text:migrations:install
rake db:migrate
```

Optionally, add the SimpleText css to your `application.css`
```Ruby
*= require simple_text/application
```

Add the documents management routes to a protected part of the routes:
```Ruby
resources :documents, only: [:edit, :update, :index, :new, :create]
```

If you've created a document, add the public route to your routes:
```Ruby
get '/disclaimer', to: 'documents#show', name: 'disclaimer'
```
