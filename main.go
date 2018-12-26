package main

import (
	"fmt"
	"html/template"
	"net/http"
	"os"
)

func main() {
	
	var color string = os.Getenv("COLOR")

	t, err := template.ParseFiles("page.tpl")

	if err != nil {
		panic(err.Error())
	}

	http.HandleFunc(
		"/",
		func(w http.ResponseWriter, r *http.Request) {
			t.Execute(w, color)
		},
	)

	http.ListenAndServe(fmt.Sprintf(":%s", os.Getenv("HTTP_PORT")), nil)
}
