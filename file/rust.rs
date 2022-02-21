use std::fs::File;
use std::io::Read;

fn main() {
    let mut data = Vec::new();
    let mut f = File::open("assets/unsplash.jpg").expect("Unable to open file");
    f.read_to_end(&mut data).expect("Unable to read data");
    println!("Bytes read: {}", data.len());
}