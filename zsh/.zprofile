
# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/brew shellenv)"
export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/roberttarabrin/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
