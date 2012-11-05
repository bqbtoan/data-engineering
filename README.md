### Simple Setup
Clone my fork and checkout the solution branch

```bash
$ git clone https://github.com/steelThread/data-engineering.git
$ cd data-engineering
$ git checkout solution
```

Run migrations + specs and start the rails server.

```bash
$ rake db:migrate spec
$ rails s
```