package main

import "fmt"
import "os"

func fileExists(fi string) bool {
	_, err := os.Stat(fi)
	return err == nil
}

func main() {
	args := os.Args

	// if we pass a CLI arg, then this is the project
	var project string

	if len(args) == 2 {
		project = args[1]
	}
	Resolve(project)
}

func Resolve(project string) string {
	// this is one way to have default args
	// works, but I don't like it!
	return ResolveToHome(project, "~/personal/project/")
}

func ResolveToHome(project string, home string) string {

	fmt.Println("TODO for", project)

	// look for a todofile
	if fileExists(".todofile") {
		fmt.Println(".todofile found!")
		// TODO - read from the .todofile
	}

	// look for folder locally (ie local todo.md)
	if fileExists("todo.md") {
		fmt.Println("local todo.md found!")
	}

	// check if a file exists in ~/personal/project/{project}/todo.md

	// fallback to project/{project}.md
	filename := home + "/" + project
	if !fileExists(filename) {
		fmt.Println(filename, "does not exist")
	}

	return filename
}
