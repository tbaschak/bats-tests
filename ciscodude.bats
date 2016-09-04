#!/usr/bin/env bats

@test "Ciscodude: root domain wpg" {
  run curl -i --header 'Host: ciscodude.net' http://wpg.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: root domain sfo" {
  run curl -i --header 'Host: ciscodude.net' http://sfo.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: www wpg" {
  run curl -i --header 'Host: www.ciscodude.net' http://wpg.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: www sfo" {
  run curl -i --header 'Host: www.ciscodude.net' http://sfo.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: blog wpg" {
  run curl -i --header 'Host: blog.ciscodude.net' http://wpg.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: blog sfo" {
  run curl -i --header 'Host: blog.ciscodude.net' http://sfo.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://ciscodude.net/" ]]
}

@test "Ciscodude: https wpg" {
  run curl --header 'Host: ciscodude.net' https://wpg.ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Ciscodude: https sfo" {
  run curl --header 'Host: ciscodude.net' https://sfo.ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Ciscodude: https ping wpg" {
  run curl --header 'Host: ciscodude.net' https://wpg.ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}

@test "Ciscodude: https ping sfo" {
  run curl --header 'Host: ciscodude.net' https://sfo.ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}
