#!/usr/bin/env bats

@test "Ciscodude stuff: https" {
  run curl --header 'Host: stuff.ciscodude.net' https://stuff.ciscodude.net/
  [[ $output =~ "Index of /" ]]
}

@test "Ciscodude mx0: http" {
  run curl -i --header 'Host: mx0.ciscodude.net' http://mx0.ciscodude.net/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude mx0: https" {
  run curl -i --header 'Host: mx0.ciscodude.net' https://mx0.ciscodude.net/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude mx0: http mail" {
  run curl -i --header 'Host: mx0.ciscodude.net' http://mx0.ciscodude.net/mail/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://mx0.ciscodude.net/mail/" ]]
}

@test "Ciscodude mx0: https mail" {
  run curl -i --header 'Host: mx0.ciscodude.net' https://mx0.ciscodude.net/mail/
  [[ $output =~ "200 OK" ]]
}

@test "Ciscodude ipam: http root" {
  run curl -i --header 'Host: ipam.ciscodude.co' http://ipam.ciscodude.co/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ipam.ciscodude.co/" ]]
}

@test "Ciscodude ipam: https root" {
  run curl -i --header 'Host: ipam.ciscodude.co' https://ipam.ciscodude.co/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ipam.ciscodude.co/auth/login" ]]
}

@test "Ciscodude ipam: https login" {
  run curl -i --header 'Host: ipam.ciscodude.co' https://ipam.ciscodude.co/auth/login
  [[ $output =~ "200 OK" ]]
}

