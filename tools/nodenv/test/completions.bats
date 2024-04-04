#!/usr/bin/env bats

load test_helper

create_command() {
  bin="${NODENV_TEST_DIR}/bin"
  mkdir -p "$bin"
  echo "$2" > "${bin}/$1"
  chmod +x "${bin}/$1"
}

@test "command with no completion support" {
  create_command "nodenv-hello" "#!$BASH
    echo hello"
  run nodenv-completions hello
  assert_success
  assert_output "--help"
}

@test "command with completion support" {
  create_command "nodenv-hello" "#!$BASH
# Provide nodenv completions
if [[ \$1 = --complete ]]; then
  echo hello
else
  exit 1
fi"
  run nodenv-completions hello
  assert_success
  assert_output - <<OUT
--help
hello
OUT
}

@test "forwards extra arguments" {
  create_command "nodenv-hello" "#!$BASH
# provide nodenv completions
if [[ \$1 = --complete ]]; then
  shift 1
  for arg; do echo \$arg; done
else
  exit 1
fi"
  run nodenv-completions hello happy world
  assert_success
  assert_output - <<OUT
--help
happy
world
OUT
}
