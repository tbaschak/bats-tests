#!/usr/bin/env bats

@test "Ciscodude: root domain" {
  run curl -i http://ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://secure.ciscodude.net/" ]]
}

@test "Ciscodude: www" {
  run curl -i http://www.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://secure.ciscodude.net/" ]]
}

@test "Ciscodude: blog" {
  run curl -i http://blog.ciscodude.net/
  [[ $output =~ "301 Moved" ]]
  [[ $output =~ "Location: https://secure.ciscodude.net/" ]]
}

@test "Ciscodude: https" {
  run curl https://secure.ciscodude.net/
  [[ $output =~ "CiscoDude.net" ]]
}

@test "Ciscodude: https ping" {
  run curl https://secure.ciscodude.net/ping/
  [[ $output =~ "OK" ]]
}

