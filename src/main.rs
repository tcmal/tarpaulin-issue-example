use coverage_test::boolean::not;

fn main() {
    println!("{}", not(true));
    println!("{}", not(false));
}


#[cfg(test)]
mod tests {
    use crate::main;

    #[test]
    fn test_main() {
        main()
    }
}
