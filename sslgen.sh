rm *.pen 

#create a certificate 

openssl req -x509 -newkey rsa:4096 -days 365 -keyout ca-key.pen -out ca-cert.pen -subj "C=IN/ST=Rajasthan/L=Jaipur/O=SWPL/OU=Developer/CN=SWPL/emailAddress=anmolnoor59@gmail.com"

echo "CA's self-signed certificate"

openssl x509 -in ca-cert.pen -noout -text


# create a CSR 

openssl req -newkey rsa:4096 -keyout server-key.pen -out server-req.pen -subj "/C=FR/ST=Ile de France/L=Paris/O=PC Book/OU=Computer/CN=*.pcbook.com/emailAddress=pcbook@gmail.com"

openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile server-ext.cnf


# Create server certificate

echo "Server's signed certificate"

openssl x509 -in server-cert.pem -noout -text
