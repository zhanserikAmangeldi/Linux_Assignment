url="http://0.0.0.0:8081"
for i in {1..1000}
do
  curl -X GET $url
done
