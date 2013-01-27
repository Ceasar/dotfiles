"""
Commands in this file are executed before the first prompt is displayed in
interactive mode.
"""
from __future__ import print_function, division

# import useful modules

import inspect
import pprint

from math import *


def print(*args, **kwargs):
    """Override `print` with `pprint`."""
    return pprint.pprint(*args, **kwargs)


# enable auto-completion for the Python interpreter

try:
    import readline
except ImportError:
    print("could not import readline")
else:
    import sys
    import rlcompleter
    if(sys.platform == 'darwin'):
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")
