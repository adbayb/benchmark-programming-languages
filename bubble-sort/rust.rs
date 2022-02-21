fn create(size: usize) -> Vec<usize> {
	let mut list = vec![0; size];

	for i in 0..list.len() {
		list[i] = size - i;
	}

	return list;
}

fn main() {
	let mut list = create(10000);

	for i in 0..list.len() {
		for j in 0..list.len() - i - 1 {
			if list[j] > list[j + 1] {
				let tmp = list[j];
				list[j] = list[j+1];
				list[j+1] = tmp;
			}
		}
	}
}