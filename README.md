Module for IPSEC
============================

IPSEC is used to create secure host-to-host and network-to-network 
connections

Basic usage
-----------

To install IPSSEC

    include ipsec

Configure a host-to-host connection
-----------------------------------

You can easily configure a host-to-host connection. A minimal example is:

    ipsec::connection { 'Server1-To-Server2':
        destination => '192.168.1.100',
        psk         => 'foobar!'
    }

On the Server2 side you can collect an exported configuration:

    Ipsec::Connection <<| tag == "ipsec-${::ipaddress}" |>>

Notes
-----

Contributors
------------

Copyright and License
---------------------

Copyright (C) 2012 [Jared Curtis]

Jared Curtis can be contacted at: jared@shift-e.info

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
