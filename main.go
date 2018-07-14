package main

import (
	"log"
	"net/http"
	"github.com/gorilla/mux"
	"fmt"
)

func HelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello World")
}

func main() {
	fmt.Println("Serving http requests at port 8080")
	router := mux.NewRouter()
	router.HandleFunc("/", HelloWorld).Methods("GET")
	log.Fatal(http.ListenAndServe(":8080", router))
}
