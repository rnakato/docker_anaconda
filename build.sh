for tag in latest #20190523
do
    docker build -t rnakato/anaconda:$tag .
    docker push rnakato/anaconda:$tag
done
