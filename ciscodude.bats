#!/usr/bin/env bats

@test "Ciscodude: root domain" {
  run curl -i http://ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: www" {
  run curl -i http://www.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: blog" {
  run curl -i http://blog.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: https" {
  run curl https://ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Ciscodude: https ping" {
  run curl https://ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}

@test "Ciscodude stuff: https" {
  run curl https://stuff.ciscodude.net/
  [[ $output =~ "Index of /" ]]
}

@test "Ciscodude mx0: http" {
  run curl -i http://mx0.ciscodude.net/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude mx0: https" {
  run curl -i https://mx0.ciscodude.net/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude mx0: http mail" {
  run curl -i http://mx0.ciscodude.net/mail/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://mx0.ciscodude.net/mail/" ]]
}

@test "Ciscodude mx0: https mail" {
  run curl -i https://mx0.ciscodude.net/mail/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude bgplogger: https" {
  run curl -i https://bgplogger.ciscodude.net/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude ipam: http root" {
  run curl -i http://ipam.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ipam.ciscodude.net/" ]]
}

@test "Ciscodude ipam: https root" {
  run curl -i https://ipam.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ipam.ciscodude.net/auth/login" ]]
}

@test "Ciscodude ipam: https login" {
  run curl -i https://ipam.ciscodude.net/auth/login
  [[ $output =~ "200 OK" ]]
}

