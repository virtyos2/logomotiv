# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_logomotiv_session',
  :secret      => 'a2fc6d873f6003b01a69a4f4ef274887e643d8217de49121313e2b05929ba540e84bd1de3903c6ee3168782bb2cfe9196212a8be16ab95d726e1dd09d1aae5bc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
