#!/usr/bin/env bats

@test "Nerdzone: root domain wpg" {
  run curl -i --header 'Host: nerdzone.ca' http://wpg.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://nerdzone.ca/" ]]
}

@test "Nerdzone: root domain sfo" {
  run curl -i --header 'Host: nerdzone.ca' http://sfo.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://nerdzone.ca/" ]]
}

@test "Nerdzone: www wpg" {
  run curl -i --header 'Host: www.nerdzone.ca' http://wpg.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://nerdzone.ca/" ]]
}

@test "Nerdzone: www sfo" {
  run curl -i --header 'Host: www.nerdzone.ca' http://sfo.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://nerdzone.ca/" ]]
}

@test "Nerdzone: https wpg" {
  run curl --header 'Host: nerdzone.ca' https://wpg.ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Nerdzone: https sfo" {
  run curl --header 'Host: nerdzone.ca' https://sfo.ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Nerdzone: https ping wpg" {
  run curl --header 'Host: nerdzone.ca' https://wpg.ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}

@test "Nerdzone: https ping sfo" {
  run curl --header 'Host: nerdzone.ca' https://sfo.ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}

