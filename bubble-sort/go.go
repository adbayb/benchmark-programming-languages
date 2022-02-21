package main

func create(size int) []int {
	list := make([]int, size)

	for i := 0; i < size; i++ {
		list[i] = size - i
	}

	return list
}

func main() {
	list := create(10000)

	for i := 0; i < len(list); i++ {
		for j := 0; j < len(list)-1-i; j++ {
			if list[j] > list[j+1] {
				tmp := list[j]
				list[j] = list[j+1]
				list[j+1] = tmp
			}
		}
	}
}
