# workspace

Repository that includes all vlcn repos as sub-modules.

Why? So we can have all the code in a single tree and manage it as if it were a mono-repo.

Why not a mono-repo? Mainly due to how github organizes issues, milestones, etc. and these should be separated by repo.

Also, when APIs stabilize we'll allow checkout out of and working on these sub-components in isolation. I.e., there's no reason for strut to be in the same tree as cr-sqlite other than strut is a first test use case and driving many features of initial cr-sqlite development.

# Modules

1. cr-sqlite: Convergent Replicated SQLite.
2. crsqlite-js: JS packages for using cr-sqlite in Node & the browser
3. live-examples-js: Examples of using cr-sqlite and other vlcn components
4. misc-js: misc libs
5. model-js: an ORM we'll eventually return to (i.e., aphrodite.sh)
6. strut: a local first presentation editor powered by cr-sqlite
