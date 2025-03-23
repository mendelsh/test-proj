package main

import (
	"fmt"
	"net/http"
	"log"
)


func main() {

	http.HandleFunc("/", handleSearch)

	fmt.Println("Server is running on port 8080")

	log.Fatal(http.ListenAndServe(":8080", nil))

}

func handleSearch(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s! \nbatel added this part", r.URL.Path[1:])
}
#batel added this part before merging
#bla bla bla!
#brrrrr
#something


