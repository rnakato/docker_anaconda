for tag in 20220323 #latest #20190523
do
    docker build -f Dockerfile.$tag -t rnakato/anaconda:$tag .
    docker push rnakato/anaconda:$tag
    docker build -f Dockerfile.$tag -t rnakato/anaconda .
    docker push rnakato/anaconda
done
