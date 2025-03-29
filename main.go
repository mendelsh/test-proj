package main

import (
	"fmt"
	"net/http"
	"log"
)


func main() {

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	http.HandleFunc("/", handleSearch)

	fmt.Println("Server is running on port 8080")

	log.Fatal(http.ListenAndServe(":8080", nil))

}

func handleSearch(w http.ResponseWriter, r *http.Request) {
	name := os.Getenv("MENDEL")
	mail := os.Getenv("MAIL")
	pass := os.Getenv("PASSWORD")
	url := os.Getenv("URL")
	

	fmt.Fprintf(w, "Hello, %s! \nbatel added this part", r.URL.Path[1:])
	fmt.Fprintf(w, "my name is %s ,my email is %s ,my password is %s, my website is %s"   name, mail, pass, url )
}



