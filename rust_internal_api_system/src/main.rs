use std::panic;

fn simple_function()  -> Result<(), &'static str> {
    let mut num = 5;
    loop {
        num -= 1;

        let result = 3/num;

        println!("{}", result);

        if num == -1 {
            println!("OK, that's enough");
            break;
        }
    }

    return Ok(())
}

fn main() {
    let result = panic::catch_unwind(|| {
        simple_function();
    });

    if (result.is_err()) {
        println!("We got an error.");
    }

    println!("Hello, world!");
    println!("I'm yingshaoxo!");
}
