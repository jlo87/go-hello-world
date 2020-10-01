package main

import (
	"fmt"
	"log"
	"net/http"
	"runtime"

	"github.com/nicholasjackson/env"
)

var (
	buildVersion string
	bindAddress  = env.String("BIND_ADDRESS", false, ":9090", "Bind address for the server")
)

func HelloWorld(rw http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(rw, "Hello World, I am Build Version: %s\n", buildVersion)
	fmt.Fprintf(rw, "Running on Go, version: %s\n", runtime.Version())

}

func main() {

	env.Parse()

	http.HandleFunc("/", HelloWorld)

	fmt.Println("Bind Address:", *bindAddress)

	log.Fatal(http.ListenAndServe(*bindAddress, nil))
}
