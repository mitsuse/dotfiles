## Version History

### 20151222

* pyenv: Merge recent changes from rbenv as of 2015-12-14 (#504)
* python-build: Add a `OPENSSL_NO_SSL3` patch for CPython 2.6, 2.7, 3.0, 3.1, 3.2 and 3.3 series (#507, #511)
* python-build: Stopped using mirror at yyuu.github.io for CPython since http://www.python.org is on fast.ly

### 20151210

* pyenv: Add a default hook for Anaconda to look for original `$PATH` (#491)
* pyenv: Skip virtualenv aliases on `pyenv versions --skip-aliases` (yyuu/pyenv-virtualenv#126)
* python-build: Add CPython 2.7.11, 3.5.1 (#494, #498)
* python-build: Update OpenSSL to 1.0.1q (#496)
* python-build: Adding SSL patch to build 2.7.3 on Debian (#495)

### 20151124

* pyenv: Import recent changes from rbenv 5fb9c84e14c8123b2591d22e248f045c7f8d8a2c
* pyenv: List anaconda-style virtual environments as a version in pyenv (#471)
* python-build: Import recent changes from ruby-build v20151028
* python-build: Add PyPy 4.0.1 (#489)
* python-build: Add `miniconda*-3.18.3` (#477)
* python-build: Add CPython 2.7.11 RC1

### 20151105

* python-build: Add anaconda2-2.4.0 and anacondaa3-2.4.0
* python-biuld: Add Portable PyPy 4.0 (#472)

### 20151103

* python-build: Add PyPy 4.0.0 (#463)
* python-build: Add Jython 2.7.1b2
* python-build: Add warning about setuptools issues on CPython 3.0.1 on OS X (#456)

### 20151006

* pyenv: Different behaviour when invoking .py script through symlink (#379, #404)
* pyenv: Enabled Gitter on the project (#436, #444)
* python-build: Add Jython 2.7.1b1
* python-build: Install OpenSSL on OS X if no proper versionn is available (#429)

### 20150913

* python-build: Add CPython 3.5.0
* python-build: Remove CPython 3.5.0 release candidates
* python-build: Fixed anaconda3 repo's paths (#439)
* python-build: Add miniconda-3.16.0 and miniconda3-3.16.0 (#435)

### 20150901

* python-build: Add CPython 3.5.0 release candidates; 3.5.0rc1 and 3.5.0rc2
* python-build: Disabled `_FORTITY_SOURCE` to fix CPython >= 2.4, <= 2.4.3 builds (#422)
* python-build: Removed CPython 3.5.0 betas
* python-build: Add miniconda-3.10.1 and miniconda3-3.10.1 (#414)
* python-build: Add PyPy 2.6.1 (#433)
* python-build: Add PyPy-STM 2.3 and 2.5.1 (#428)
* python-build: Ignore user's site-packages on ensurepip/get-pip (#411)
* pyenv: Import recent changes from ruby-build v20150818

#### 20150719

* python-build: Add CPython `3.6-dev` (#413)
* python-build: Add Anaconda/Anaconda3 2.3.0
* python-build: Fix download URL of portable PyPy 2.6 (fixes #389)
* python-build: Use custom `MACOSX_DEPLOYMENT_TARGET` if defined (#312)
* python-build: Use original CPython repository instead of mirror at bitbucket.org as the source of `*-dev` versions (#409)
* python-build: Pin pip version to 1.5.6 for python 3.1.5 (#351)

#### 20150601

* python-build: Add PyPy 2.6.0
* python-build: Add PyPy 2.5.1 portable
* python-build: Add CPython 3.5.0 beta releases; 3.5.0b1 and 3.5.0b2
* python-build: Removed CPython 3.5.0 alpha releases
* python-build: Fix inverted condition for `--altinstall` of ensurepip (#255)
* python-build: Skip installing `setuptools` by `ez_setup.py` explicitly (fixes #381)
* python-build: Import changes from ruby-build v20150519

#### 20150524

* pyenv: Improve `pyenv version`, if there is one missing (#290)
* pyenv: Improve pip-rehash to handle versions in command, like `pip2` and `pip3.4` (#368)
* python-build: Add CPython release; 2.7.10 (#380)
* python-build: Add Miniconda/Miniconda3 3.9.1 and Anaconda/Anaconda3 2.2.0 (#375, #376)

#### 20150504

* python-build: Add Jython 2.7.0
* python-build: Add CPython alpha release; 3.5.0a4
* python-build: Add CPython 3.1, 3.1.1, and 3.1.2
* python-build: Fix pip version to 1.5.6 for CPython 3.1.x (#351)

#### 20150326

* python-build: Add Portable PyPy binaries from https://github.com/squeaky-pl/portable-pypy (#329)
* python-build: Add CPython alpha release; 3.5.0a2 (#328)
* python-build: Add pypy-2.5.1 (fixes #338)
* pyenv: Import recent changes from rbenv 4d72eefffc548081f6eee2e54d3b9116b9f9ee8e

#### 20150226

* python-build: Add CPython release; 3.4.3 (#323)
* python-build: Add CPython alpha release; 3.5.0a1 (#324)
* python-build: Add Miniconda/Miniconda3 3.8.3 (#318)

#### 20150204

* python-build: Add PyPy 2.5.0 release (#311)
* python-build: Add note about `--enable-shared` and RPATH (#217)
* python-build: Fix regression of `PYTHON_MAKE_INSTALL_TARGET` and add test (#255)
* python-build: Symlink `pythonX.Y-config` to `python-config` if `python-config` is missing (#296)
* python-build: Latest `pip` can't be installed into `3.0.1` (#309)

#### 20150124

* python-build: Import recent changes from ruby-build v20150112
* python-build: Prevent adding `/Library/Python/X.X/site-packages` to `sys.path` whtn `--enable-framework` is enabled on OS X. Thanks @s1341 (#292)
* python-build: Add new IronPython release; 2.7.5

#### 20141211

* pyenv: Add bulit-in `pip-rehash` feature. You don't need to install [pyenv-pip-rehash](https://github.com/yyuu/pyenv-pip-rehash) anymore.
* python-build: Add new CPython release; 2.7.9 (#284)
* python-build: Add new PyPy releases; pypy3-2.4.0, pypy3-2.4.0-src (#277)
* python-build: Add build definitions of PyPy nightly build

#### 20141127

* python-build: Add new CPython release candidates; 2.7.9rc1 (#276)

#### 20141118

* python-build: Fix broken `setup_builtin_patches` (#270)
* python-build: Add a patch to allow building 2.6.9 on OS X 10.9 with `--enable-framework` (#269, #271)

#### 20141106

* pyenv: Optimize pyenv-which. Thanks to @blueyed (#129)
* python-build: Add Miniconda/Miniconda3 3.7.0 and Anaconda/Anaconda3 2.1.0 (#260)
* python-build: Use HTTPS for mirror download URLs (#262)
* python-build: Set `rpath` for `--shared` build of PyPy (#244)
* python-build: Support `make altinstall` when building CPython/Stackless (#255)
* python-build: Import recent changes from ruby-build v20141028 (#265)

#### 20141012

* python-build: Add new CPython releases; 3.2.6, 3.3.6 (#253)

#### 20141011

* python-build: Fix build error of Stackless 3.3.5 on OS X (#250)
* python-build: Add new Stackless releases; stackless-2.7.7, stackless-2.7.8, stackless-3.4.1 (#252)

#### 20141008

* python-build: Add new CPython release; 3.4.2 (#251)
* python-build: Add new CPython release candidates; 3.2.6rc1, 3.3.6rc1 (#248)

#### 20140924

* pyenv: Fix an unintended behavior when user does not have write permission on `$PYENV_ROOT` (#230)
* pyenv: Fix a zsh completion issue (#232)
* python-build: Add new PyPy release; pypy-2.4.0, pypy-2.4.0-src (#241)

#### 20140825

* pyenv: Fix zsh completion with multiple words (#215)
* python-build: Display the package name of `hg` as `mercurial` in message (#212)
* python-build: Unset `PIP_REQUIRE_VENV` during build (#216)
* python-build: Set `MACOSX_DEPLOYMENT_TARGET` from the product version of OS X (#219, #220)
* python-build: Add new Jython release; jython2.7-beta3 (#223)

#### 20140705

* python-build: Add new CPython release; 2.7.8 (#201)
* python-build: Support `SETUPTOOLS_VERSION` and `PIP_VERSION` to allow installing specific version of setuptools/pip (#202)

#### 20140628

* python-build: Add new Anaconda releases; anaconda-2.0.1, anaconda3-2.0.1 (#195)
* python-build: Add new PyPy3 release; pypy3-2.3.1 (#198)
* python-build: Add ancient CPython releases; 2.1.3, 2.2.3, 2.3.7 (#199)
* python-build: Use `ez_setup.py` and `get-pip.py` instead of installing them from tarballs (#194)
* python-build: Add support for command-line options to `ez_setup.py` and `get-pip.py` (#200)

#### 20140615

* python-build: Update default setuptools version (4.0.1 -> 5.0) (#190)

#### 20140614

* pyenv: Change versioning schema (`v0.4.0-YYYYMMDD` -> `vYYYYMMDD`)
* python-build: Add new PyPy release; pypy-2.3.1, pypy-2.3.1-src
* python-build: Create symlinks for executables with version suffix (#182)
* python-build: Use SHA2 as default digest algorithm to verify downloaded archives
* python-build: Update default setuptools version (4.0 -> 4.0.1) (#183)
* python-build: Import recent changes from ruby-build v20140524 (#184)

#### 0.4.0-20140602

* python-build: Add new Anaconda/Anaconda3 releases; anaconda-2.0.0, anaconda3-2.0.0 (#179)
* python-build: Add new CPython release; 2.7.7 (#180)
* python-build: Update default setuptools version (3.6 -> 4.0) (#181)
* python-build: Respect environment variables of `CPPFLAGS` and `LDFLAGS` (#168)
* python-build: Support for xz-compressed Python tarballs (#177)

#### 0.4.0-20140520

* python-build: Add new CPython release; 3.4.1 (#170, #171)
* python-build: Update default pip version (1.5.5 -> 1.5.6) (#169)

#### 0.4.0-20140516

* pyenv: Prefer gawk over awk if both are available.
* python-build: Add new PyPy release; pypy-2.3, pypy-2.3-src (#162)
* python-build: Add new Anaconda release; anaconda-1.9.2 (#155)
* python-build: Add new Miniconda releases; miniconda-3.3.0, minoconda-3.4.2, miniconda3-3.3.0, miniconda3-3.4.2
* python-build: Add new Stackless releases; stackless-2.7.3, stackless-2.7.4, stackless-2.7.5, stackless-2.7.6, stackless-3.2.5, stackless-3.3.5 (#164)
* python-build: Add IronPython versions (setuptools and pip will work); ironpython-2.7.4, ironpython-dev
* python-build: Add new Jython beta release; jython-2.7-beta2
* python-build: Update default setuptools version (3.4.1 -> 3.6)
* python-build: Update default pip version (1.5.4 -> 1.5.5)
* python-build: Update GNU Readline (6.2 -> 6.3)
* python-build: Import recent changes from ruby-build v20140420

#### 0.4.0-20140404

* pyenv: Reads only the first word from version file. This is as same behavior as rbenv.
* python-build: Fix build of Tkinter with Tcl/Tk 8.6 (#131)
* python-build: Fix build problem with Readline 6.3 (#126, #131, #149, #152)
* python-build: Do not exit with errors even if some of modules are absent (#131)
* python-build: MacOSX was mispelled as MaxOSX in `anaconda_architecture` (#136)
* python-build: Use default `cc` as the C Compiler to build CPython (#148, #150)
* python-build: Display value from `pypy_architecture` and `anaconda_architecture` on errors (yyuu/pyenv-virtualenv#18)
* python-build: Remove old development version; 2.6-dev
* python-build: Update default setuptools version (3.3 -> 3.4.1)

#### 0.4.0-20140317

* python-build: Add new CPython releases; 3.4.0 (#133)
* python-build: Add new Anaconda releases; anaconda-1.9.0, anaconda-1.9.1
* python-build: Add new Miniconda releases; miniconda-3.0.4, miniconda-3.0.5, miniconda3-3.0.4, miniconda3-3.0.5
* python-build: Update default setuptools version (3.1 -> 3.3)

#### 0.4.0-20140311

* python-build: Add new CPython releases; 3.3.5 (#127)
* python-build: Add new CPython release candidates; 3.4.0rc1, 3.4.0rc2, 3.4.0rc3
* python-build: Update default setuptools version (2.2 -> 3.1)
* python-build: Update default pip version (1.5.2 -> 1.5.4)
* python-build: Import recent changes from ruby-build v20140225

#### 0.4.0-20140211

* python-build: Add new CPython release candidates; 3.3.4, 3.4.0b3
* python-build: Add [Anaconda](https://store.continuum.io/cshop/anaconda/) and [Miniconda](http://repo.continuum.io/miniconda/) binary distributions
* python-build: Display error if the wget does not support Server Name Indication (SNI) to avoid SSL verification error when downloading from https://pypi.python.org. (#60)
* python-build: Update default setuptools version (2.1 -> 2.2)
* python-build: Update default pip version (1.5.1 -> 1.5.2)
* python-build: Import recent changes from ruby-build v20140204

#### 0.4.0-20140123

* pyenv: Always append the directory at the top of the `$PATH` to return proper value for `sys.executable` (#98)
* pyenv: Unset `GREP_OPTIONS` to avoid issues of conflicting options (#101)
* python-build: Install `pip` with using `ensurepip` if available
* python-build: Add support for framework installation (`--enable-framework`) of CPython (#55, #99)
* python-build: Import recent changes from ruby-build v20140110.1
* python-build: Import `bats` tests from ruby-build v20140110.1

#### 0.4.0-20140110.1

* python-build: Fix build error of CPython 2.x on the platform where the `gcc` is llvm-gcc.

#### 0.4.0-20140110

* pyenv: Reliably detect parent shell in `pyenv init` (#93)
* pyenv: Import recent changes from rbenv 0.4.0
* pyenv: Import `bats` tests from rbenv 0.4.0
* python-build: Add new CPython releases candidates; 3.4.0b2
* python-build: Add ruby-build style patching feature (#91)
* python-build: Set `RPATH` if `--enable-shared` was given (#65, #66, 82)
* python-build: Update default setuptools version (2.0 -> 2.1)
* python-build: Update default pip version (1.4.1 -> 1.5)
* python-build: Activate friendly CPython during build if the one is not activated (8fa6b4a1847851919ad7857c6c42ed809a4d277b)
* python-build: Fix broken install.sh
* python-build: Import recent changes from ruby-build v20131225.1
* version-ext-compat: Removed from default plugin. Please use [pyenv-version-ext](https://github.com/yyuu/pyenv-version-ext) instead.

#### 0.4.0-20131217

* python-build: Fix broken build of CPython 3.3+ on Darwin
* python-build: Not build GNU Readline uselessly on Darwin

#### 0.4.0-20131216

* python-build: Add new CPython releases; 3.3.3 (#80)
* python-build: Add new CPython releases candidates; 3.4.0b1
* python-build: Add new PyPy releases; pypy-2.2.1, pypy-2.2.1-src
* python-build: Update default setuptools version (1.3.2 -> 2.0)
* python-build: Imported recent changes from ruby-build v20131211
* pyenv: Fix pyenv-prefix to trim "/bin" in `pyenv prefix system` (#88)

#### 0.4.0-20131116

* python-build: Add new CPython releases; 2.6.9, 2.7.6 (#76)
* python-build: Add new CPython release candidates; 3.3.3-rc1, 3.3.3-rc2
* python-build: Add new PyPy releases; pypy-2.2, pypy-2.2-src (#77)
* python-build: Update default setuptools version (1.1.6 -> 1.3.2)
* python-build: Imported recent changes from ruby-build v20131030

#### 0.4.0-20131023

* pyenv: Improved [fish shell](http://fishshell.com/) support
* python-build: Add new PyPy releases; pypy-2.1, pypy-2.1-src, pypy3-2.1-beta1, pypy3-2.1-beta1-src
* python-build: Add ancient versions; 2.4, 2.4.1, 2.4.3, 2.4.4 and 2.4.5
* python-build: Add alpha releases; 3.4.0a2, 3.4.0a3, 3.4.0a4
* python-build: Update default pip version (1.4 -> 1.4.1)
* python-build: Update default setuptools version (0.9.7 -> 1.1.6)

#### 0.4.0-20130726

* pyenv: Fix minor issue of variable scope in `pyenv versions`
* python-build: Update base version to ruby-build v20130628
* python-build: Use brew managed OpenSSL and GNU Readline if they are available
* python-build: Fix build of CPython 3.3+ on OS X (#29)
* python-build: Fix build of native modules of CPython 2.5 on OS X (#33)
* python-build: Fix build of CPython 2.6+ on openSUSE (#36)
* python-build: Add ancient versions; 2.4.2 and 2.4.6. The build might be broken. (#37)
* python-build: Update default pip version (1.3.1 -> 1.4)
* python-build: Update default setuptools version (0.7.2 -> 0.9.7)

#### 0.4.0-20130613

* pyenv: Changed versioning schema. There are two parts; the former is the base rbenv version, and the latter is the date of release.
* python-build: Add `--debug` option to build CPython with debug symbols. (#11)
* python-build: Add new CPython versions: 2.7.4, 2.7.5, 3.2.4, 3.2.5, 3.3.1, 3.3.2 (#12, #17)
* python-build: Add `svnversion` patch for old CPython versions (#14)
* python-build: Enable mirror by default for faster download (#20)
* python-build: Add `OPENSSL_NO_SSL2` patch for old CPython versions (#22)
* python-build: Install GNU Readline on Darwin if the system one is broken (#23)
* python-build: Bundle patches in `${PYTHON_BUILD_ROOT}/share/python-build/patches` and improve patching mechanism (`apply_patches`).
* python-build: Verify native extensions after building. (`build_package_verify_py*`)
* python-build: Add `install_hg` to install package from Mercurial repository
* python-build: Support building Jython and PyPy.
* python-build: Add new CPython development versions: 2.6-dev, 2.7-dev, 3.1-dev, 3.2-dev, 3.3-dev, 3.4-dev
* python-build: Add new Jython development versions: jython-2.5.4-rc1, jython-2.5-dev, jython-2.7-beta1, jython-dev
* python-build: Add new PyPy versions: pypy-1.5{,-src}, pypy-1.6, pypy-1.7, pypy-2.0{,-src}, pypy-2.0.1{,-src}, pypy-2.0.2{,-src}
* python-build: Add new PyPy development versions: pypy-1.7-dev, pypy-1.8-dev, pypy-1.9-dev, pypy-2.0-dev, pypy-dev, pypy-py3k-dev
* python-build: Add new Stackless development versions: stackless-2.7-dev, stackless-3.2-dev, stackless-3.3-dev, stackless-dev
* python-build: Update default pip version (1.2.1 -> 1.3.1)
* python-build: Update default setuptools version (0.6.34 (distribute) -> 0.7.2 ([new setuptools](https://bitbucket.org/pypa/setuptools)))

#### 0.2.0 (February 18, 2013)

* Import changes from rbenv 0.4.0.

#### 0.1.2 (October 23, 2012)

* Add push/pop for version stack management.
* Support multiple versions via environment variable.
* Now GCC is not a requirement to build CPython and Stackless.

#### 0.1.1 (September 3, 2012)

* Support multiple versions of Python at a time.

#### 0.1.0 (August 31, 2012)

* Initial public release.
