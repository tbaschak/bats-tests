#!/usr/bin/env bats

@test "Henchman 21: root domain" {
  run curl -i --header 'Host: henchman21.net' http://henchman21.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://henchman21.net" ]]
}

@test "Henchman 21: www" {
  run curl -i --header 'Host: www.henchman21.net' http://www.henchman21.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://henchman21.net" ]]
}

@test "Henchman 21: https" {
  run curl --header 'Host: henchman21.net' https://henchman21.net/
  [[ $output =~ "<title>Henchman21.net</title>" ]]
}
