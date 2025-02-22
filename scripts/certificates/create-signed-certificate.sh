#!/bin/sh

hostname="$1"

# Create server certificate, signed by the new root certificate authority
openssl req -new -nodes -text -out server.csr \
  -keyout server.key -subj "/CN=${hostname}"
chmod og-rwx server.key
sudo chown postgres:postgres server.key

openssl x509 -req -in server.csr -text -days 365 \
  -CA root.crt -CAkey root.key -CAcreateserial \
  -out server.crt
sudo mv server.key server.crt ~postgres/
