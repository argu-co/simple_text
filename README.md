# SimpleText
A simple markdown document system to present documents such as Terms & Conditions or a Privacy Policy.
## Usage
Generate the migration and run migrations:
```Ruby
rake simple_text:migrations:install
rake db:migrate
```
Which will generate a migration for the `documents` table.

Optionally, add the SimpleText css to your `application.css`
```Scss
*= require simple_text/application
```

Add the documents management routes to a protected part of the routes:
```Ruby
resources :documents, only: [:edit, :update, :index, :new, :create]
```

In a document, `name` is the key for the document, `title` is shown to users above the document.

If you've created a document, add the public route to your routes:
```Ruby
get '/disclaimer', to: 'documents#show', name: 'disclaimer'
```

And finally, link to your document:
```Ruby
link_to 'Disclaimer', disclaimer_path
```

## Overriding the default controller
For certain functionality, overriding the `DocumentsController` is required, e.g. to make [Pundit](https://github.com/elabs/pundit) work:
```Ruby
class DocumentsController < SimpleText::DocumentsController
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index
  after_action :make_authorized, except: :index
  after_action :make_scoped, only: :index

  def make_authorized
    authorize @document
  end

  def make_scoped
    policy_scope @documents
  end
end
```

## Some TODO's
- Make the model name changable.
- Write tests.
- Make integration of [Whodunnit](https://github.com/fletcher91/whodunnit) optional via config
