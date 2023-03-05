#![allow(unused)]

use std::env;

// test the rust cross compile
fn main() {
    println!("Hello, world! cross compile for linux");
    let envs = env::vars();
    for (k, v) in envs {
        println!("env item {:?}={:?}", k, v)
    }
}
