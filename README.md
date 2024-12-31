# bash-stomp
A bash tool for detecting bash method overrides


The goal here is to detect when one bash method overrides another.  Such is the case if an engineer were to accidentally define the same method twice in the same file, or performs a `source` on a file and accidentally overrides a method contained within it. This could cause libraries to behave in ways that the original author did not expect, and may result in unintended behavior.