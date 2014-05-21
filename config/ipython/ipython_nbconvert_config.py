# Configuration file for ipython.
config = get_config()

# lines of code to run at IPython startup.
config.InteractiveShellApp.exec_lines = [
    '%load_ext autoreload',
    '%autoreload 2',
]
