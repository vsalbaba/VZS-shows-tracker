# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demonstrations_session',
  :secret      => 'b6ba1a4a110625867967cf16b8483d2790b76b598e40e205f7d498ce2366e97906f4707e9230d80f9762dfcaa4cd7425a0e67560842101b129bb8eb4a4637b2d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
