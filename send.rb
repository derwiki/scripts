#!/usr/bin/ruby
# http://stackoverflow.com/questions/1822425/sending-mail-from-bash-shell-script/1940826#1940826
require 'net/smtp'

SMTPHOST = 'localhost'
FROM = ARGV[0]
to = ARGV[1]
subject = ARGV[2]

def send(to, subject, message)
  body = <<EOF
From: #{FROM}
To: #{to}
Subject: #{subject}

#{message}
EOF
  Net::SMTP.start(SMTPHOST) do |smtp|
    smtp.send_message body, FROM, to
  end
end

send(to, subject, STDIN.read)
