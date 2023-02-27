# README

## Run The Project

### Versions:

* Ruby 2.7.5
* Rails 7.0.4.2
* Bundler 2.4.3
* Vite 4
* Vue 3
* PostgreSQL 14.6


### Create a Account at Stripe

Register for [Stripe](https://stripe.com) if you don't have an account, after that create a store in test mode.
In the Developers/API Keys tab are the api keys needed to run the project.

### Clone the Project

Open Terminal in the directory you want and run:
```
git clone "https://github.com/IgorFZ/ecommerce.git"
cd ecommerce
```

After that install ruby gems with:
```
bundle install
``` 

At Frontend directory and run:
```
npm install
```

### Rack Cors Configuration

At config/initializers/cors.rb:
```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: %w[Authorization Uid]
  end
end
```

### Rails Credentials

Go back to the root of the project and delete the credentials.yml.enc file from the config folder, then run:
```
rake secret
```

This will generate something like(copy this):
```
48818a178d8cc36e08590b3452bed41595fd8b2f052055c09da01205aa6b554eefa29559602ddf8e03ea8518a9ad81ac37f1ff7ed5589ad21cce5a2166dd6930
```

To recreate and edit your credentials run:
```
EDITOR=nano rails credentials:edit
```
This will create two files:
  * master.key
  * credentials.yml.enc

Add a jwt_secret_key with your generated secret:
``` 
devise:
  jwt_secret_key: 48818a178d8cc36e08590b3452bed41595fd8b2f052055c09da01205aa6b554eefa29559602ddf8e03ea8518a9ad81ac37f1ff7ed5589ad21cce5a2166dd6930
```

Open another tab in Terminal and install the Stripe CLI according to the documentation: [Get started with the Stripe CLI | Stripe Documentation](https://stripe.com/docs/stripe-cli). After login:
``` 
stripe listen --forward-to localhost:3000/webhooks
```

Copy your webhook key and add to the credentials with your Stripe public and private keys like:
``` 
stripe:
  secret: sk_test_51Mde5UIlj...
  public: pk_test_51Mde5UIlj...
  webhook: whsec_f95e7bd5cb9...
```
Press Crtl+O, Enter And Ctrl+X to save and close rails credentials.

### Database
```
rails db:create && rails db:migrate
```
And you can run rails db:seed to get some test data.
```
rails db:seed
```

### Run

Open three tabs in the terminal, two tabs in the root, one for the Rails API, one for listen Stripe Webhooks. And the last one for Frontend with Vite/Vue:
<br>

At root:
```
rails s
```

And
```
stripe listen --forward-to localhost:3000/webhooks
```

The last one in the frontend directory: 
```
npm run dev
```

Now project is running perfectly, you can test at your [localhost](http://localhost:5173/).
