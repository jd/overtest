==========
 Overtest
==========

Overtest is a suite of tools that allows to start and stop daemons for a quick
throw-away usage. This is typically useful when needing these daemons to run
`integration testing`_.

Supported daemons
=================

Overtest currently supports:

* PostgreSQL


Usage
=====
To use Overtest, simply call the `overtest-$daemon` program that you need. It
will setup the temporary environment and export a few environment variable for
you to accesss it::

  $ overtest-postgresql --exec psql template1
  The files belonging to this database system will be owned by user "jd".
  This user must also own the server process.

  The database cluster will be initialized with locale "en_US.UTF-8".
  The default database encoding has accordingly been set to "UTF8".
  The default text search configuration will be set to "english".

  Data page checksums are disabled.

  fixing permissions on existing directory /var/folders/7k/pwdhb_mj2cv4zyr0kyrlzjx40000gq/T/overtest-postgresql-XXXXXX.MW00RvMv ... ok
  creating subdirectories ... ok
  selecting default max_connections ... 100
  selecting default shared_buffers ... 128MB
  selecting dynamic shared memory implementation ... posix
  creating configuration files ... ok
  creating template1 database in /var/folders/7k/pwdhb_mj2cv4zyr0kyrlzjx40000gq/T/overtest-postgresql-XXXXXX.MW00RvMv/base/1 ... ok
  initializing pg_authid ... ok
  initializing dependencies ... ok
  creating system views ... ok
  loading system objects' descriptions ... ok
  creating collations ... ok
  creating conversions ... ok
  creating dictionaries ... ok
  setting privileges on built-in objects ... ok
  creating information schema ... ok
  loading PL/pgSQL server-side language ... ok
  vacuuming database template1 ... ok
  copying template1 to template0 ... ok
  copying template1 to postgres ... ok
  syncing data to disk ... ok

  WARNING: enabling "trust" authentication for local connections
  You can change this by editing pg_hba.conf or using the option -A, or
  --auth-local and --auth-host, the next time you run initdb.

  Success. You can now start the database server using:

      /usr/local/Cellar/postgresql/9.4.5_2/bin/postgres -D /var/folders/7k/pwdhb_mj2cv4zyr0kyrlzjx40000gq/T/overtest-postgresql-XXXXXX.MW00RvMv
  or
      /usr/local/Cellar/postgresql/9.4.5_2/bin/pg_ctl -D /var/folders/7k/pwdhb_mj2cv4zyr0kyrlzjx40000gq/T/overtest-postgresql-XXXXXX.MW00RvMv -l logfile start

  waiting for server to start....LOG:  database system was shut down at 2016-01-05 17:12:24 CET
  LOG:  MultiXact member wraparound protections are now enabled
  LOG:  database system is ready to accept connections
  LOG:  autovacuum launcher started
   done
  server started
  I: executing command: psql template1
  Expanded display is used automatically.
  Line style is unicode.
  SET
  psql (9.4.5)
  Type "help" for help.

  template1=# \l
                                List of databases
     Name    │ Owner │ Encoding │   Collate   │    Ctype    │ Access privileges
  ───────────┼───────┼──────────┼─────────────┼─────────────┼───────────────────
   postgres  │ jd    │ UTF8     │ en_US.UTF-8 │ en_US.UTF-8 │
   template0 │ jd    │ UTF8     │ en_US.UTF-8 │ en_US.UTF-8 │ =c/jd            ↵
             │       │          │             │             │ jd=CTc/jd
   template1 │ jd    │ UTF8     │ en_US.UTF-8 │ en_US.UTF-8 │ =c/jd            ↵
             │       │          │             │             │ jd=CTc/jd
  (3 rows)

  template1=# \q
  waiting for server to shut down....LOG:  received smart shutdown request
  LOG:  autovacuum launcher shutting down
  LOG:  shutting down
  LOG:  database system is shut down
   done
  server stopped


.. _integration testing: https://en.wikipedia.org/wiki/Integration_testing
