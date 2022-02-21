package main

import "fmt"

func main() {
	size := 100000
	var value int = 0

	for i := 0; i < size; i++ {
		value = i
	}

	fmt.Println(value)
}
