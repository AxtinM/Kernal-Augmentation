//this is the first code written in rust it's really a simple code but it'll get more complex when
//we start building the project 
//to run this code run $ cargo run
//

fn main() {
    use std::{thread, time};
    thread::sleep(time::Duration::from_secs(2));
    println!("this is the first rust code!");
    thread::sleep(time::Duration::from_secs(2));
    println!("We will try to use rust to code our prototypes.");
    thread::sleep(time::Duration::from_secs(2));
    println!("as we go forward and advance we may use other programming language if we are obligated!");
    thread::sleep(time::Duration::from_secs(2));
    println!("But no worries ! we will port all codes to rust when we get the chance.");
    thread::sleep(time::Duration::from_secs(2));
}
