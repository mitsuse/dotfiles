#!/usr/bin/env bats

load test_helper

setup() {
  mkdir -p "${NODENV_TEST_DIR}/myproject"
  cd "${NODENV_TEST_DIR}/myproject"
}

@test "fails without arguments" {
  run nodenv-version-file-read
  assert_failure
  refute_output
}

@test "fails for invalid file" {
  run nodenv-version-file-read "non-existent"
  assert_failure
  refute_output
}

@test "fails for blank file" {
  echo > my-version
  run nodenv-version-file-read my-version
  assert_failure
  refute_output
}

@test "reads simple version file" {
  cat > my-version <<<"1.9.3"
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.9.3"
}

@test "ignores leading spaces" {
  cat > my-version <<<"  1.9.3"
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.9.3"
}

@test "reads only the first word from file" {
  cat > my-version <<<"1.9.3-p194@tag 1.8.7 hi"
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.9.3-p194@tag"
}

@test "loads only the first line in file" {
  cat > my-version <<IN
1.8.7 one
1.9.3 two
IN
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.8.7"
}

@test "ignores leading blank lines" {
  cat > my-version <<IN

1.9.3
IN
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.9.3"
}

@test "handles the file with no trailing newline" {
  echo -n "1.8.7" > my-version
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.8.7"
}

@test "ignores carriage returns" {
  cat > my-version <<< $'1.9.3\r'
  run nodenv-version-file-read my-version
  assert_success
  assert_output "1.9.3"
}

@test "prevents directory traversal" {
  cat > my-version <<<".."
  run nodenv-version-file-read my-version
  assert_failure
  assert_output "nodenv: invalid version in \`my-version'"

  cat > my-version <<<"../foo"
  run nodenv-version-file-read my-version
  assert_failure
  assert_output "nodenv: invalid version in \`my-version'"
}

@test "allows path segments in version string" {
  cat > my-version <<<"lts/carbon"
  run nodenv-version-file-read my-version
  assert_success
  assert_output "lts/carbon"
}
