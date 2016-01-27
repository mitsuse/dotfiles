#!/usr/bin/env bats

load test_helper

setup() {
  export PYENV_ROOT="${TMP}/pyenv"
}

stub_pyenv() {
  setup_version "${PYENV_VERSION}"
  create_executable "${PYENV_VERSION}" "virtualenv"
  stub pyenv-prefix "echo '${PYENV_ROOT}/versions/${PYENV_VERSION}'"
  stub pyenv-prefix "echo '${PYENV_ROOT}/versions/${PYENV_VERSION}'"
  stub pyenv-hooks "virtualenv : echo"
  stub pyenv-rehash " : echo rehashed"
}

unstub_pyenv() {
  unstub pyenv-prefix
  unstub pyenv-hooks
  unstub pyenv-rehash
  teardown_version "${PYENV_VERSION}"
}

@test "create virtualenv from given version" {
  export PYENV_VERSION="3.2.1"
  stub_pyenv "${PYENV_VERSION}"
  stub pyenv-virtualenv-prefix " : false"
  stub pyenv-exec "virtualenv * : echo PYENV_VERSION=\${PYENV_VERSION} \"\$@\""
  stub pyenv-exec "python -s -m ensurepip : false"
  stub pyenv-exec "python -s */get-pip.py : true"
  stub curl true

  run pyenv-virtualenv "3.2.1" "venv"

  assert_success
  assert_output <<OUT
PYENV_VERSION=3.2.1 virtualenv ${PYENV_ROOT}/versions/3.2.1/envs/venv
Installing pip from https://bootstrap.pypa.io/get-pip.py...
rehashed
OUT

  unstub_pyenv
  unstub pyenv-virtualenv-prefix
  unstub pyenv-exec
  unstub curl
}

@test "create virtualenv from current version" {
  export PYENV_VERSION="3.2.1"
  stub_pyenv "${PYENV_VERSION}"
  stub pyenv-version-name "echo \${PYENV_VERSION}"
  stub pyenv-virtualenv-prefix " : false"
  stub pyenv-exec "virtualenv * : echo PYENV_VERSION=\${PYENV_VERSION} \"\$@\""
  stub pyenv-exec "python -s -m ensurepip : false"
  stub pyenv-exec "python -s */get-pip.py : true"
  stub curl true

  run pyenv-virtualenv venv

  assert_success
  assert_output <<OUT
PYENV_VERSION=3.2.1 virtualenv ${PYENV_ROOT}/versions/3.2.1/envs/venv
Installing pip from https://bootstrap.pypa.io/get-pip.py...
rehashed
OUT

  unstub_pyenv
  unstub pyenv-version-name
  unstub pyenv-virtualenv-prefix
  unstub pyenv-exec
  unstub curl
}

@test "create virtualenv with short options" {
  export PYENV_VERSION="3.2.1"
  stub_pyenv "${PYENV_VERSION}"
  stub pyenv-version-name "echo \${PYENV_VERSION}"
  stub pyenv-virtualenv-prefix " : false"
  stub pyenv-exec "virtualenv * : echo PYENV_VERSION=\${PYENV_VERSION} \"\$@\""
  stub pyenv-exec "python -s -m ensurepip : false"
  stub pyenv-exec "python -s */get-pip.py : true"
  stub curl true

  run pyenv-virtualenv -v -p ${TMP}/python venv

  assert_output <<OUT
PYENV_VERSION=3.2.1 virtualenv --verbose --python=${TMP}/python ${PYENV_ROOT}/versions/3.2.1/envs/venv
Installing pip from https://bootstrap.pypa.io/get-pip.py...
rehashed
OUT
  assert_success

  unstub_pyenv
  unstub pyenv-version-name
  unstub pyenv-virtualenv-prefix
  unstub pyenv-exec
  unstub curl
}

@test "create virtualenv with long options" {
  export PYENV_VERSION="3.2.1"
  stub_pyenv "${PYENV_VERSION}"
  stub pyenv-version-name "echo \${PYENV_VERSION}"
  stub pyenv-virtualenv-prefix " : false"
  stub pyenv-exec "virtualenv * : echo PYENV_VERSION=\${PYENV_VERSION} \"\$@\""
  stub pyenv-exec "python -s -m ensurepip : false"
  stub pyenv-exec "python -s */get-pip.py : true"
  stub curl true

  run pyenv-virtualenv --verbose --python=${TMP}/python venv

  assert_output <<OUT
PYENV_VERSION=3.2.1 virtualenv --verbose --python=${TMP}/python ${PYENV_ROOT}/versions/3.2.1/envs/venv
Installing pip from https://bootstrap.pypa.io/get-pip.py...
rehashed
OUT
  assert_success

  unstub_pyenv
  unstub pyenv-version-name
  unstub pyenv-virtualenv-prefix
  unstub pyenv-exec
  unstub curl
}

@test "no whitespace allowed in virtualenv name" {
  run pyenv-virtualenv "3.2.1" "foo bar"

  assert_failure
  assert_output <<OUT
pyenv-virtualenv: no whitespace allowed in virtualenv name.
OUT
}

@test "no tab allowed in virtualenv name" {
  run pyenv-virtualenv "3.2.1" "foo	bar baz"

  assert_failure
  assert_output <<OUT
pyenv-virtualenv: no whitespace allowed in virtualenv name.
OUT
}

@test "system not allowed as virtualenv name" {
  run pyenv-virtualenv "3.2.1" "system"

  assert_failure
  assert_output <<OUT
pyenv-virtualenv: \`system' is not allowed as virtualenv name.
OUT
}

@test "no slash allowed in virtualenv name" {
  run pyenv-virtualenv "3.2.1" "foo/bar"

  assert_failure
  assert_output <<OUT
pyenv-virtualenv: no slash allowed in virtualenv name.
OUT
}

@test "slash allowed if it is the long name of the virtualenv" {
  export PYENV_VERSION="3.2.1"
  stub_pyenv "${PYENV_VERSION}"
  stub pyenv-virtualenv-prefix " : false"
  stub pyenv-exec "virtualenv * : echo PYENV_VERSION=\${PYENV_VERSION} \"\$@\""
  stub pyenv-exec "python -s -m ensurepip : false"
  stub pyenv-exec "python -s */get-pip.py : true"
  stub curl true

  run pyenv-virtualenv "3.2.1" "3.2.1/envs/foo"

  assert_success
  assert_output <<OUT
PYENV_VERSION=3.2.1 virtualenv ${PYENV_ROOT}/versions/3.2.1/envs/foo
Installing pip from https://bootstrap.pypa.io/get-pip.py...
rehashed
OUT

  unstub_pyenv
  unstub pyenv-virtualenv-prefix
  unstub pyenv-exec
  unstub curl
}
