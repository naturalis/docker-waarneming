#!/bin/bash

echo "-----------------------"
echo "creating directory"
echo "create ssl template"
mkdir -p ssl
./generate_cert \
	--host \
	  "waarneming.nl" \
	  "www.waarneming.nl" \
		"observation.org" \
		"www.observation.org" \
		"observations.be" \
		"www.observations.be" \
		"waarnemingen.be" \
		"www.waarneming.be" \
		"wnimg.nl" \
		"www.wnimg.nl" \
	--ca

certs=(waarneming_nl-chained.crt observation_org-chained.crt observations_be-chained.crt www_wnimg_nl-chained.crt waarnemingen_be-chained.crt)
keys=(waarneming_nl.key observation_org.key waarnemingen_be.key observations_be.key www_wnimg_nl.key)

echo "copying certs to ssldir"
for cert in "${certs[@]}"
do
	cp cert.pem ssl/$cert
done

echo "copying keys to ssldir"
for key in "${keys[@]}"
do
	cp key.pem ssl/$key
done

echo "cleanup"
rm key.pem
rm cert.pem

echo "-----------------------"
