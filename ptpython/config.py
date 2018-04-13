# from __future__ import unicode_literals
# from prompt_toolkit.filters import ViInsertMode
# from prompt_toolkit.key_binding.input_processor import KeyPress
# from prompt_toolkit.keys import Keys
# from pygments.token import Token
#
# from ptpython.layout import CompletionVisualisation

__all__ = ('configure', )


def configure(repl):
    repl.vi_mode = True
