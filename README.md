#Instructions

1. Login to AMI
2. Run the following:

```bash 
cd riak-1.4.2

sed -i 's/{storage_backend, riak_kv_bitcask_backend}/{storage_backend, riak_kv_eleveldb_backend}/' rel/files/app.config

make devrel

for i in {1..5}; do dev/dev$i/bin/riak start; done
for i in {2..5}; do dev/dev$i/bin/riak-admin cluster join dev1@127.0.0.1; done
```