# Enables deep reloading of modules
c.InteractiveShellApp.extensions = ["autoreload"]
c.InteractiveShellApp.exec_lines = ["%autoreload 2"]

# VI mode
c.TerminalInteractiveShell.editing_mode = "vi"

# Syntax highlighting style
c.TerminalInteractiveShell.highlighting_style = "monokai"

# Autocomplete behavior
c.IPCompleter.greedy = True

# Show function signature/docs in pager
c.IPCompleter.use_jedi = True

# Automatically show traceback on error
c.InteractiveShell.xmode = "Context"
