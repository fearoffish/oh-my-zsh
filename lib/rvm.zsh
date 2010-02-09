# Ruby Version Manager
if [ -s ~/.rvm/scripts/rvm ] ; then
  source ~/.rvm/scripts/rvm
 
  #
  # Warning: These can be slow as *fuck* if using jRuby (and probably others).
  #
 
  # Prompt function. Return the interpreter name (ruby, jruby, etc)
  function ruby_prompt_interpreter {
    interpreter=$(
      rvm info |
      grep -m 1 'interpreter' |
      sed 's/^.*interpreter:[ ]*//' |
      sed 's/["]//g'
    ) || return
    echo $interpreter
  }
 
  # Prompt function. Return the full version string.
  function ruby_prompt_version_full {
    version=$(
      rvm info |
      grep -m 1 'full_version' |
      sed 's/^.*full_version:[ ]*//' |
      sed 's/["]//g'
    ) || return
    echo $version
  }
 
  # Prompt function. Return just the version number.
  function ruby_prompt_version {
    version=$(
      ~/.rvm/bin/rvm-prompt i v p
    ) || return
    echo $version
  }
fi # Ruby Version Manager