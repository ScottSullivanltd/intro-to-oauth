# README

## Ref:  https://github.com/omniauth/omniauth

## Ref: https://github.com/zquestz/omniauth-google-oauth2

# OmniAuth Google OAuth2 Strategy
Strategy to authenticate with Google via OAuth2 in OmniAuth.

Get your API key at: https://code.google.com/apis/console/ Note the Client ID and the Client Secret.

For more details, read the Google docs: https://developers.google.com/accounts/docs/OAuth2

# Installation
Add to your Gemfile:

`gem 'omniauth-google-oauth2'`
Then bundle install.

### Google API Setup
Go to 'https://console.developers.google.com'
Select your project.
Go to Credentials, then select the "OAuth consent screen" tab on top, and provide an 'EMAIL ADDRESS' and a 'PRODUCT NAME'
Wait 10 minutes for changes to take effect.

## Usage
Here's an example for adding the middleware to a Rails app in config/initializers/omniauth.rb:

`Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
OmniAuth.config.allowed_request_methods = %i[get]`

You can now access the OmniAuth Google OAuth2 URL: /auth/google_oauth2

For more examples please check out examples/omni_auth.rb

NOTE: While developing your application, if you change the scope in the initializer you will need to restart your app server. Remember that either the 'email' or 'profile' scope is required!

Here's an example of a possible configuration where the strategy name is changed, the user is asked for extra permissions, the user is always prompted to select their account when logging in and the user's profile picture is returned as a thumbnail:

`Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    {
      scope: 'userinfo.email, userinfo.profile, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end`

## Auth Hash
Access an authentication hash available in the callback with `request.env['omniauth.auth']:`
