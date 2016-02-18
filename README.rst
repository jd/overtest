==========
 Overtest
==========

Overtest is a suite of tools that allows to start and stop daemons for a quick
throw-away usage. This is typically useful when needing these daemons to run
`integration testing`_.

Supported daemons
=================

Overtest currently supports:

* `PostgreSQL`_
* `MySQL`_
* `Memcached`_
* `InfluxDB`_
* `Etcd`_
* `Redis`_ (with sentinel mode)
* `Elasticsearch`_
* `ZooKeeper`_
* `Gnocchi`_

.. _PostgreSQL: http://postgresql.org
.. _MySQL: http://mysql.org
.. _Memcached: http://memcached.org
.. _InfluxDB: http://influxdb.org
.. _Etcd: https://coreos.com/etcd/
.. _Redis: http://redis.io/
.. _Elasticsearch: https://www.elastic.co/
.. _ZooKeeper: https://zookeeper.apache.org/
.. _Gnocchi: http://gnocchi.xyz

Usage
=====
To use Overtest, simply call the `overtest $daemon` program that you need. It
will setup the temporary environment and export a few environment variable for
you to accesss it::

  $ overtest postgresql psql template1
  I: starting postgresql
  I: started postgresql
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
  I: stopping postgresql
  I: stopped postgresql

You can also source `overtest` itself in one of your script. It will set the
environment up, and will clean as soon as your script exit::

  #!/bin/bash
  source overtest postgresql
  # Do something with PostgreSQL
  # The script will clean things for you

Environment variables
=====================
Overtest exports a few environment variable:

* `OVERTEST_DAEMON` which contains the name of the daemon launched
* `OVERTEST_URL` which contains the URL to the daemon
* `OVERTEST_$daemon_*` variables, which contains daemon specific variables,
  such as port, database name, URL, etc.

.. _integration testing: https://en.wikipedia.org/wiki/Integration_testing

Driver specific options
=======================

Redis
-----

The sentinel mode of Redis can be enabled by setting the environment variable
`OVERTEST_REDIS_SENTINEL_ENABLE` to any value.
