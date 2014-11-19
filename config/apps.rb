##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '5334e71e00b8f6ad9c42748a4f43979952c4712e8256d216f25b37fde13bcba5'
  set :protection, :except => :path_traversal
  set :protect_from_csrf, true
end

# Mounts the core application for this project
Padrino.mount('ComputingArithmeticQuiz::App', :app_file => Padrino.root('app/app.rb')).to('/')
