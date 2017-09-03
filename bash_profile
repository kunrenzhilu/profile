solving the tensorflow inability under ipython
issue: 
     30   from weakref import finalize
     31 except ImportError:
---> 32   from backports.weakref import finalize
     33 
     34 from tensorflow.python.platform import tf_logging

ImportError: No module named weakref
reason:
	ipython is running a mix in global and venv
solution
    https://coderwall.com/p/xdox9a/running-ipython-cleanly-inside-a-virtualenv
    alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
