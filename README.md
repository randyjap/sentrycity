See free demo deployment on heroku here:
h1 [https://sentry-city.herokuapp.com/](https://sentry-city.herokuapp.com/)

Follow deployment instructions below to setup AWS EC2 deployment.

* Ruby Version
2.6.3p62

* Dependencies
- https://imagemagick.org/index.php
- Node v11.12.0 or higher
- Yarn v1.15.2 or higher
- MySQL 5.7

* 3rd Party Services
- Facebook for Authentication
- Google Maps API for autocompleting and geocoding addresses
- AWS S3 for storage
- Bigquery for persisting emails sent to customers
- Raven/ Sentry for App Error Alerts, Monitoring, and Logging
- Sendgrid for sending emails
- Loggly (Heroku Only) for Server Logging

* Configure Credentials to Connect to 3rd Party Services
Open encrypted credentials via:
`rails credentials:edit`

Sign up for services and get keys to fill out currently required redacted template below:
```YAML
# Used as the base secret for all MessageVerifiers in Rails including the one protecting cookies.
secret_key_base: ******

facebook:
  App_ID: ******
  App_Secret: ******

google:
  key: ******

aws:
  service: S3
  access_key_id: ******
  secret_access_key: ******
  region: us-east-1
  bucket: ******

bigquery:
  project_id: ******
  dataset: my_dataset
  table: email_storage

gcs:
  type: service_account
  project_id: ******
  private_key_id: ******
  private_key: "******"
  client_email: ******
  client_id: ******
  auth_uri: ******
  token_uri: ******
  auth_provider_x509_cert_url: ******
  client_x509_cert_url: ******

raven:
  dsn: ******

sendgrid:
  username: ******
  password: ******

database:
  production: ******

rails_configs:
  rails_serve_static_files: true
```

* Database Creation and Initialization
`rails db:create`
`rails db:schema:load` (WARNING: wipes everything!)
`rails db:seed` (for demo data)

* How to run the test suite
`rspec`

* Deployment instructions
Use cloudformation template in 'deployment/cloudformation.yml' to create the AWS infrastructure to host the app.  Copy over the 'config/master.key' into the shared config folder (e.g. ../www/sentrycity/shared/config).

Deploy via capistrano with `cap production deploy`.  Set 'BRANCH' environment variable to deploy anything other than master.