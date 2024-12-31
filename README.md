# bash-stomp
A bash tool for detecting bash method overrides.


## Scoping in bash can be tricky

This project improves the quality of bash scripts by raising awareness of accidental overrides.

An accidental override can occur when a developer re-declares a method that had already been declared. An accidental override can happen when developers compose scripts together using `source`, or when simply defining functions in a single script. Accidental overrides can cause programs to behave in unexpected and unpredictable ways, and can be difficult to debug. See the `/demo` directory for some examples of accidental overrides.

This project is a proof of concept that alerts developers when they have overridden an existing method.



## Using this project

The magic happens within the `no-stomp.sh` script.  Simply source `no-stomp.sh` into the root of your bash script, then execute your script as normal.  `no-stomp.sh` will cause your script to execute in verbose mode, and provide additional output when methods are declared `<< DEBUG: $method DECLARED >>` and overridden `<< WARNING: $method OVERRIDDEN >>`.

These debug statements are included in the verbose output, and also logged separately to the `output.log` file for convenience.

See the `/demo` directory for a sample project.

