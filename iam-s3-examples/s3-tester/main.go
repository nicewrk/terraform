package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)

var (
	filename = flag.String("filename", "", "filename")
)

func main() {
	flag.Parse()

	f, err := os.Open(*filename)
	if err != nil {
		log.Fatal(err)
	}

	region := "us-east-2"
	sess, err := session.NewSession(&aws.Config{
		Region: &region,
	})
	if err != nil {
		log.Fatal(err)
	}

	out, err := s3manager.NewUploader(sess).Upload(&s3manager.UploadInput{
		Bucket:      aws.String("nicewrk-service"),
		Key:         aws.String("staging/img2.jpg"),
		ACL:         aws.String("public-read"),
		ContentType: aws.String("image/jpg"),
		Body:        f,
	})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(out.Location)
}
