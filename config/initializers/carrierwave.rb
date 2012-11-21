CarrierWave.configure do |config|
  config.ftp_host = ENV['FTP_HOST'] || Settings.ftp.host
  config.ftp_port = ENV['FTP_PORT'] || Settings.ftp.port
  config.ftp_user = ENV['FTP_USER'] || Settings.ftp.user
  config.ftp_passwd = ENV['FTP_PASSWD'] || Settings.ftp.passwd
  config.ftp_folder = ENV['FTP_FOLDER'] || Settings.ftp.folder
  config.ftp_url = ENV['FTP_URL'] || Settings.ftp.url
  config.ftp_passive = true # Heroku does not support active mode
end
