package main

import (
	"fmt"
	"os"
)

func main() {
	file, err := os.Open("assets/unsplash.jpg")

	if err != nil {
		fmt.Println(err)
		return
	}

	defer file.Close()
	info, err := file.Stat()

	if err != nil {
		fmt.Println(err)
		return
	}

	size := info.Size()
	buffer := make([]byte, size)
	bytesRead, err := file.Read(buffer)

	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("Bytes read:", bytesRead)
}
